import 'package:SparkPet/screens/challenges.dart';
import 'package:SparkPet/screens/closet_store.dart';
import 'package:SparkPet/screens/exercise_history.dart';
import 'package:SparkPet/screens/home.dart';
import 'package:SparkPet/screens/leaderboard.dart';
import 'package:SparkPet/icons/spark_icons.dart';
import 'package:flutter/material.dart';


class SparkPet extends StatefulWidget {
  const SparkPet({Key? key}) : super(key: key);

  @override
  State<SparkPet> createState() => _SparkPetState();
}

class _SparkPetState extends State<SparkPet> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 66,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: NavigationBar(
                    indicatorColor: Colors.blue,
                    indicatorShape: CircleBorder(),
                    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    selectedIndex: currentPageIndex,
                    destinations: const <Widget>[
                      NavigationDestination(
                        icon: Icon(SparkIcons.history, size: 30),
                        label: 'History',
                      ),
                      NavigationDestination(
                        icon: Icon(SparkIcons.hanger, size: 30),
                        label: 'Closet',
                      ),
                      NavigationDestination(
                        icon: Icon(SparkIcons.home, size: 0),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: Icon(SparkIcons.leaderboard, size: 30),
                        label: 'Leaderboard',
                      ),
                      NavigationDestination(
                        icon: Icon(SparkIcons.goals, size: 30),
                        label: 'Challenges',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (currentPageIndex == 2) ? Colors.blue : Colors.black,
                ),
                child: GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.only(
                      bottom: 16,
                      top: 14,
                      left: 14,
                      right: 14,
                    ),
                    child: Icon(
                      SparkIcons.home,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      currentPageIndex = 2;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
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
