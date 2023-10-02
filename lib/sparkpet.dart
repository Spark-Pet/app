import 'package:SparkPet/screens/challenges.dart';
import 'package:SparkPet/screens/closet_store.dart';
import 'package:SparkPet/screens/exercise_history.dart';
import 'package:SparkPet/screens/home.dart';
import 'package:SparkPet/screens/leaderboard.dart';
import 'package:flutter/material.dart';

import 'components/spark_pet_nav_bar.dart';


class SparkPet extends StatefulWidget {
  const SparkPet({Key? key}) : super(key: key);

  @override
  State<SparkPet> createState() => _SparkPetState();
}

class _SparkPetState extends State<SparkPet> {
  int currentPageIndex = 2;

  void refreshState(int newIndex) {
    setState(() {
      currentPageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: SparkPetNavBar(currentPageIndex: currentPageIndex, notifyParent: refreshState),
        body: <Widget>[
          const HistoryScreen(),
          const ClosetScreen(),
          const HomeScreen(),
          const LeaderboardScreen(),
          const ChallengesScreen(),
        ][currentPageIndex],
      ),
    );
  }
}
