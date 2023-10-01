import 'package:SparkPet/screens/challenges.dart';
import 'package:SparkPet/screens/closet_store.dart';
import 'package:SparkPet/screens/exercise_history.dart';
import 'package:SparkPet/screens/home.dart';
import 'package:SparkPet/screens/leaderboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case '/':
                return const HomeScreen();
              case '/history':
                return const HistoryScreen();
              case '/challenges':
                return const ChallengesScreen();
              case '/leaderboard':
                return const LeaderboardScreen();
              case '/closet':
                return const ClosetScreen();
              default:
                throw Exception('Invalid route: ${routeSettings.name}');
            }
          }
        );
      },
    );
  }
}
