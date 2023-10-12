import 'package:flutter/material.dart';

import '../components/challenges/challenge_cards.dart';
import '../components/challenges/challenge_switch.dart';
import '../models/challenges_data.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesState();
}

class _ChallengesState extends State<ChallengesScreen> {
  bool showActive = true; // active challenges vs historical challenges

  final List<ChallengesData> activeChallenges = challengesDb.getActiveChallenges();
  final List<ChallengesData> historicalChallenges = challengesDb.getHistoricalChallenges();

  final List<Padding> _activeChallengesList = [
    Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ChallengeCardActive(
        title: '10K in a Day',
        desc: 'Run, walk, or crawl 10,000 steps in a single day.',
        reward: 100,
        entryCost: 25,
        activeDates: 'Oct 10 - Oct 17',
      ),
    ),
    Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ChallengeCardActive(
        title: 'Hat Trick',
        desc: 'Exceed your steps goal by 50% for three days in a row.',
        reward: 250,
        entryCost: 50,
        activeDates: 'Oct 1 - Oct 31',
      ),
    ),
  ];

  final List<Padding> _historicalChallengesLIst = [
    Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ChallengeCardHistorical(
        title: 'No Rest For the Weary',
        reward: 500,
        desc: 'Meet your steps goal every day for one month.',
        activeDates: '1 - 30 Sep 2023',
        totalParticipants: '15k+',
        successRate: 67,
      ),
    ),
  ];

  void refreshState(bool newShowActive) {
    setState(() {
      showActive = newShowActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              child: ChallengesSwitchButton(
                showActive: showActive,
                toggleSwitch: refreshState,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              child: Column(
                children: showActive ? _activeChallengesList : _historicalChallengesLIst
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
