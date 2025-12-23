import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../services/api_service.dart';

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({super.key});

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  String _selectedLeague = DummyData.leagues.first['id']!;
  bool _loading = false;
  String? _error;
  List<Map<String, dynamic>> _standings = [];

  final ApiService _api = ApiService();

  @override
  void initState() {
    super.initState();
    _loadStandings();
  }

  @override
  Widget build(BuildContext context) {
    final leagues = DummyData.leagues;

    // Choose standings source based on league (for prototype we only have PL)
    final standings =
        _standings.isNotEmpty
            ? _standings
            : (_selectedLeague == 'PL'
                ? DummyData.standingsPL
                : <Map<String, dynamic>>[]);

    return Scaffold(
      appBar: AppBar(title: const Text('Standings')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                const Text('League:'),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedLeague,
                    isExpanded: true,
                    items:
                        leagues.map((l) {
                          return DropdownMenuItem(
                            value: l['id'],
                            child: Text(l['name']!),
                          );
                        }).toList(),
                    onChanged: (v) async {
                      if (v == null) return;
                      setState(() => _selectedLeague = v);
                      await _loadStandings();
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_loading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (_error != null)
            Expanded(child: Center(child: Text('Error: $_error')))
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _loadStandings(force: true),
                child: ListView.separated(
                  itemCount: standings.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final s = standings[i];
                    return ListTile(
                      leading: Text(s['rank'].toString()),
                      title: Text(s['team'].toString()),
                      trailing: Text('${s['points']} pts'),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _loadStandings({bool force = false}) async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await _api.fetchStandings(
        league: _selectedLeague,
        forceRefresh: force,
      );

      // Normalize keys for dummy vs API responses
      _standings =
          result.map((s) {
            return {
              'rank': s['intRank'] ?? s['rank'] ?? s['position'] ?? '',
              'team': s['strTeam'] ?? s['team'] ?? s['name'] ?? '',
              'points': s['intPoints'] ?? s['points'] ?? s['points'] ?? '',
            };
          }).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
