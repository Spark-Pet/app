import 'package:SparkPet/screens/challenges.dart';
import 'package:SparkPet/screens/closet_store.dart';
import 'package:SparkPet/screens/exercise_history.dart';
import 'package:SparkPet/screens/home.dart';
import 'package:SparkPet/screens/leaderboard.dart';
import 'package:flutter/material.dart';

class SparkPet extends StatefulWidget {
  const SparkPet({Key? key}) : super(key: key);

  @override
  State<SparkPet> createState() => _SparkPetState();
}

class _SparkPetState extends State<SparkPet> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.deepPurple,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.flag_circle),
              label: 'Challenges',
            ),
            NavigationDestination(
              icon: Icon(Icons.store),
              label: 'Store',
            ),
          ],
        ),
        body: <Widget>[
          const HomeScreen(),
          const HistoryScreen(),
          const LeaderboardScreen(),
          const ChallengesScreen(),
          const ClosetScreen(),
        ][currentPageIndex],
      ),
    );
  }
}
