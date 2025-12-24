import 'package:flutter/material.dart';
import 'fixtures_screen.dart';
import 'standings_screen.dart';
import 'squad_screen.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Schedule'),
                  Tab(text: 'Standings'),
                  Tab(text: 'Squad'),
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FixturesScreen(),
            StandingsScreen(),
            SquadScreen(),
          ],
        ),
      ),
    );
  }
}
