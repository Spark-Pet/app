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

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<ChallengesData> _activeChallenges = challengesDb.getActiveChallenges();
  final List<ChallengesData> _historicalChallenges = challengesDb.getHistoricalChallenges();

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
                children: showActive
                    ? _activeChallenges.map((challenge) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ChallengeCardActive(
                          title: challenge.name,
                          desc: challenge.description,
                          reward: challenge.reward,
                          entryCost: challenge.costEntry,
                          activeDates: '${challenge.startDate.day} - ${challenge.endDate.day} ${months[challenge.startDate.month - 1]} ${challenge.startDate.year}',
                        ),
                      )).toList()
                    : _historicalChallenges.map((challenge) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ChallengeCardHistorical(
                          title: challenge.name,
                          reward: challenge.reward,
                          desc: challenge.description, // DateFormat format = new DateFormat("MMMM dd, yyyy"); var formattedDate = format.parse(dateString);
                          activeDates: '${challenge.startDate.day} - ${challenge.endDate.day} ${months[challenge.startDate.month - 1]} ${challenge.startDate.year}',
                          totalParticipants: challenge.totalParticipants,
                          successRate: (challenge.successfulParticipants / challenge.totalParticipants * 100).round(),
                        ),
                      )).toList(),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
