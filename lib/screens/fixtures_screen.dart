
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart'; // Import the ApiService

// Convert to a StatefulWidget to manage the state of the API call.
class FixturesScreen extends StatefulWidget {
  const FixturesScreen({super.key});

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends State<FixturesScreen> {
  // A Future to hold the result of the API call.
  late Future<List<Map<String, dynamic>>> _fixturesFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Fetch the unified fixtures when the widget is first created.
    _fixturesFuture = _apiService.getUnifiedFixtures();
  }

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to handle the asynchronous data loading.
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fixturesFuture,
      builder: (context, snapshot) {
        // While waiting for data, show a loading spinner.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // If an error occurs, display it to the user.
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Error fetching fixtures: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        // If there's no data, show a message.
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No fixtures found.'));
        }

        // When data is available, build the list.
        final fixtures = snapshot.data!;

        return ListView.builder(
          itemCount: fixtures.length,
          itemBuilder: (context, index) {
            final match = fixtures[index];

            // --- Date Handling ---
            // The date format from the API might be different, so robust parsing is key.
            String formattedDate = 'Date TBC'; // Default text
            if (match['date'] != null) {
                // The existing logic for date formatting from the previous version of this file
                // assumed a different format. Now we will re-parse it.
                try {
                  // First, try parsing as a full DateTime object if the API provides it
                  final parsedDateTime = DateTime.parse(match['date'].toString());
                  formattedDate = DateFormat('EEE, d MMM').format(parsedDateTime);
                } catch (e) {
                  // If parsing fails, use the string as-is (e.g., "23/07")
                  formattedDate = match['date'].toString();
                } 
            }


            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildLeagueInfo(match['league'] ?? 'N/A'),
                    const SizedBox(height: 12),
                    _buildMatchRow(match),
                    const SizedBox(height: 4),
                    _buildMatchStatus(match, formattedDate),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // --- Helper Widgets (retained from the previous version) ---

  Widget _buildLeagueInfo(String league) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.shield, color: Colors.black54, size: 16),
        const SizedBox(width: 8),
        Text(
          league,
          style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMatchRow(Map<String, dynamic> match) {
    final textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    // Determine if the score should be displayed as a string or integer
    final homeScore = match['homeScore'] ?? 0;
    final awayScore = match['awayScore'] ?? 0;
    final status = match['status']?.toString().toUpperCase() ?? '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTeam(
          name: match['homeTeam'] ?? 'TBA',
          logo: match['logoHome'],
        ),
        if (status == 'FT' || status == 'PLAYED')
          Text('$homeScore - $awayScore', style: textStyle)
        else
          Text(match['time'] ?? '--:--', style: textStyle),
        _buildTeam(
          name: match['awayTeam'] ?? 'TBA',
          logo: match['logoAway'],
        ),
      ],
    );
  }

  Widget _buildTeam({required String name, String? logo}) {
    return Expanded(
      child: Column(
        children: [
          if (logo != null && logo.isNotEmpty)
            Image.network(
              logo,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.sports_soccer, size: 40, color: Colors.grey),
            )
          else
            const Icon(Icons.sports_soccer, size: 40, color: Colors.grey),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMatchStatus(Map<String, dynamic> match, String formattedDate) {
    final status = match['status']?.toString().toUpperCase() ?? '';
    String statusText = formattedDate; // Default to showing the date

    if (status == 'FT' || status == 'PLAYED') {
      statusText = 'Full Time';
    }

    return Text(
      statusText,
      style: const TextStyle(color: Colors.black54, fontSize: 12),
    );
  }
}
