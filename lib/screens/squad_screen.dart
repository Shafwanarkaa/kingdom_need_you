
import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Import the ApiService

// Convert to a StatefulWidget to manage the state for the API call.
class SquadScreen extends StatefulWidget {
  const SquadScreen({super.key});

  @override
  State<SquadScreen> createState() => _SquadScreenState();
}

class _SquadScreenState extends State<SquadScreen> {
  // A Future to hold the result of the enriched squad data.
  late Future<List<Map<String, dynamic>>> _squadFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Fetch the enriched squad data when the widget is initialized.
    _squadFuture = _apiService.getUnifiedSquad();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _squadFuture,
      builder: (context, snapshot) {
        // While waiting for data, show a loading spinner.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // If an error occurs, display it.
        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Error fetching squad data: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        // If there's no data, show a message.
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No player data found.'));
        }

        // When data is available, process and display it.
        final players = snapshot.data!;

        // The existing logic for separating players by position.
        final goalkeepers = players.where((p) => p['position'] == 'Goalkeeper').toList();
        final defenders = players.where((p) => p['position'] == 'Defender').toList();
        final midfielders = players.where((p) => p['position'] == 'Midfielder').toList();
        final forwards = players.where((p) => p['position'] == 'Forward').toList();

        // The existing ListView layout.
        return ListView(
          children: [
            _buildSectionHeader('Goalkeepers', context),
            ...goalkeepers.map((player) => _buildPlayerTile(player)),
            _buildSectionHeader('Defenders', context),
            ...defenders.map((player) => _buildPlayerTile(player)),
            _buildSectionHeader('Midfielders', context),
            ...midfielders.map((player) => _buildPlayerTile(player)),
            _buildSectionHeader('Forwards', context),
            ...forwards.map((player) => _buildPlayerTile(player)),
          ],
        );
      },
    );
  }

  // --- Helper Widgets (retained and improved from the previous version) ---

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
      ),
    );
  }

  Widget _buildPlayerTile(Map<String, dynamic> player) {
    // Use a placeholder for the image if it's missing or invalid.
    final imageUrl = player['image'] ?? player['photo'] ?? '';

    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[200],
        backgroundImage: (imageUrl.isNotEmpty && imageUrl.startsWith('http')) 
            ? NetworkImage(imageUrl) 
            : null, // Don't show a broken image icon for invalid URLs
        child: (imageUrl.isEmpty || !imageUrl.startsWith('http'))
            ? const Icon(Icons.person, size: 30, color: Colors.grey) // Placeholder icon
            : null,
      ),
      title: Text(
        player['name'] ?? 'Unknown Player',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(player['position'] ?? 'N/A'),
      trailing: Text(
        (player['number'] != null) ? '#${player['number']}' : '',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}
