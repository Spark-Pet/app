import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'challenge_cards.dart';
import 'challenge_switch.dart';
import '../data/challenges_provider.dart';
import '../domain/challenge_data.dart';
import '../../common/domain/constants.dart';

class ChallengesScreen extends ConsumerStatefulWidget {
  const ChallengesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends ConsumerState<ChallengesScreen> {
  bool showActive = true; // active challenges vs historical challenges

  void refreshState(bool newShowActive) {
    setState(() {
      showActive = newShowActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ChallengeData> activeChallenges = ref.watch(challengesDbProvider).getActiveChallenges();
    final List<ChallengeData> historicalChallenges = ref.watch(challengesDbProvider).getHistoricalChallenges();

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
                toggleActive: refreshState,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              child: Column(
                children: showActive
                    ? activeChallenges.map((challenge) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ChallengeCardActive(
                          title: challenge.name,
                          desc: challenge.description,
                          reward: challenge.reward,
                          entryCost: challenge.costEntry,
                          activeDates: '${challenge.startDate.day} - ${challenge.endDate.day} ${Constants.getFullMonth(challenge.startDate.month)} ${challenge.startDate.year}',
                        ),
                      )).toList()
                    : historicalChallenges.map((challenge) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ChallengeCardHistorical(
                          title: challenge.name,
                          reward: challenge.reward,
                          desc: challenge.description, // DateFormat format = new DateFormat("MMMM dd, yyyy"); var formattedDate = format.parse(dateString);
                          activeDates: '${challenge.startDate.day} - ${challenge.endDate.day} ${Constants.getFullMonth(challenge.startDate.month)} ${challenge.startDate.year}',
                          totalParticipants: challenge.totalParticipants,
                          successRate: challenge.successfulParticipants / challenge.totalParticipants * 100 > 0 ? (challenge.successfulParticipants / challenge.totalParticipants * 100).round() : 0,
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
