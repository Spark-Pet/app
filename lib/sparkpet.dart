import 'package:spark_pet/screens/challenges.dart';
import 'package:spark_pet/screens/closet.dart';
import 'package:spark_pet/screens/store.dart';
import 'package:spark_pet/screens/home.dart';
import 'package:spark_pet/screens/leaderboard.dart';
import 'package:flutter/material.dart';

import 'components/spark_pet_nav_bar.dart';

class SparkPet extends StatefulWidget {
  const SparkPet({Key? key}) : super(key: key);

  @override
  State<SparkPet> createState() => _SparkPetState();
}

class _SparkPetState extends State<SparkPet> {
  Container _modal = Container();
  int _currentPageIndex = 2;
  bool _showModal = false;

  void updatePageIndex(int newIndex) {
    setState(() {
      _currentPageIndex = newIndex;
    });
  }

  void updateModalContent(Container newModal) {
    setState(() {
      _showModal = true;
      _modal = newModal;
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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            <Widget>[
              const StoreScreen(),
              const ClosetScreen(),
              const HomeScreen(),
              LeaderboardScreen(
                notifyParent: updateModalContent,
              ),
              const ChallengesScreen(),
            ][_currentPageIndex],
            SparkPetNavBar(
              currentPageIndex: _currentPageIndex,
              notifyParent: updatePageIndex
            ),
            if (_showModal) Stack(
              children: [
                InkWell(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0x56000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _showModal = false;
                    });
                  },
                ),
                Center(
                  child: _modal,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
