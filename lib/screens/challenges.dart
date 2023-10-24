import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/challenges/challenge_cards.dart';
import '../components/challenges/challenge_switch.dart';
import '../models/challenges_data.dart';
import '../util/constants.dart';

final viewActiveChallengesProvider = StateProvider<bool>((_) => true);

class ChallengesScreen extends ConsumerWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ChallengesData> activeChallenges = ref.watch(challengesDbProvider).getActiveChallenges();
    final List<ChallengesData> historicalChallenges = ref.watch(challengesDbProvider).getHistoricalChallenges();
    final bool showActive = ref.watch(viewActiveChallengesProvider);

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
              child: ChallengesSwitchButton(showActive: showActive),
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
