
import 'package:flutter/material.dart';
import 'squad_screen.dart';
import 'standings_screen.dart';
import 'fixtures_screen.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TabController is used to coordinate the tab bar with the tab views.
    return DefaultTabController(
      length: 3, // We have three tabs: Fixtures, Standings, Squad
      child: Scaffold(
        // We use a nested AppBar for the tabs within the Calendar screen.
        appBar: AppBar(
          // This ensures the main AppBar's back button doesn't appear.
          automaticallyImplyLeading: false,
          // The TabBar contains the labels for each tab.
          title: TabBar(
            tabs: const [
              Tab(text: 'Fixtures'),
              Tab(text: 'Standings'),
              Tab(text: 'Squad'),
            ],
            // Indicator and label styling for better visual feedback.
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        // TabBarView holds the content for each tab.
        body: const TabBarView(
          children: [
            // The content for each tab is the corresponding screen.
            FixturesScreen(),
            StandingsScreen(),
            SquadScreen(),
          ],
        ),
      ),
    );
  }
}
