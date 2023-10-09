import 'package:flutter/material.dart';

import '../components/challenges/challenge_switch.dart';
import '../components/leaderboard/leaderboard_table_text.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesState();
}

class _ChallengesState extends State<ChallengesScreen> {
  bool showActive = true; // active challenges vs historical challenges

  void refreshState(bool newShowActive) {
    setState(() {
      showActive = newShowActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          const Text(
            'Challenges',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: ChallengesSwitchButton(
              showActive: showActive,
              toggleSwitch: refreshState,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
