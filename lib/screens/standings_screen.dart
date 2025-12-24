
import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Import the ApiService
import '../data/dummy_data.dart';   // Keep for the list of leagues

class StandingsScreen extends StatefulWidget {
  const StandingsScreen({super.key});

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  // The league ID currently selected in the dropdown.
  String _selectedLeague = DummyData.leagues.first['id']!;
  // The Future that will hold our standings data.
  late Future<List<Map<String, dynamic>>> _standingsFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Initial fetch of standings when the screen loads.
    _fetchStandings();
  }

  // A dedicated method to fetch standings. This can be called from initState
  // and also when the user selects a new league.
  void _fetchStandings() {
    setState(() {
      _standingsFuture = _apiService.fetchStandings(league: _selectedLeague);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLeagueSelector(),
        _buildHeader(),
        // Use a FutureBuilder to display the data from the API.
        Expanded(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _standingsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Error fetching standings: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No standings available.'));
              }

              // If data is ready, build the standings list.
              return _buildStandingsList(snapshot.data!);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLeagueSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedLeague,
        items: DummyData.leagues.map((l) {
          return DropdownMenuItem(
            value: l['id'],
            child: Text(l['name']!),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null && value != _selectedLeague) {
            _selectedLeague = value;
            // When the user selects a new league, fetch the new standings.
            _fetchStandings();
          }
        },
        decoration: const InputDecoration(
          labelText: 'League',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: const Row(
        children: [
          SizedBox(width: 30, child: Text('Pos', style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text('Club', style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 30, child: Text('Pl', style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 30, child: Text('GD', style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 40, child: Text('Pts', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Widget _buildStandingsList(List<Map<String, dynamic>> standings) {
    return ListView.separated(
      itemCount: standings.length,
      separatorBuilder: (_, __) => const Divider(height: 0),
      itemBuilder: (context, index) {
        final team = standings[index];
        final teamName = team['strTeam'] ?? 'Unknown Team';
        final isMU = teamName.contains('Man United') || teamName.contains('Manchester United');
        final style = TextStyle(
          fontWeight: isMU ? FontWeight.bold : FontWeight.normal,
          color: isMU ? Colors.red.shade800 : Colors.black,
        );

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          color: isMU ? Colors.red.withOpacity(0.05) : Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: Text(team['intRank']?.toString() ?? '-', style: style),
              ),
              Expanded(
                child: Row(
                  children: [
                    if (team['strBadge'] != null && team['strBadge'].isNotEmpty)
                      Image.network(team['strBadge'], width: 20, height: 20, errorBuilder: (c,e,s) => const Icon(Icons.shield, size: 20, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Flexible(child: Text(teamName, style: style, overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
              SizedBox(width: 30, child: Text(team['intPlayed']?.toString() ?? '-', style: style, textAlign: TextAlign.center)),
              SizedBox(width: 30, child: Text(team['intGoalDifference']?.toString() ?? '-', style: style, textAlign: TextAlign.center)),
              SizedBox(width: 40, child: Text(team['intPoints']?.toString() ?? '-', style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.right)),
            ],
          ),
        );
      },
    );
  }
}
