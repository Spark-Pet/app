import 'package:flutter/material.dart';

import '../../../icons/bone_icon.dart';

class ChallengeCardActive extends StatelessWidget {
  const ChallengeCardActive({
    super.key,
    required this.title,
    required this.reward,
    required this.entryCost,
    required this.desc,
    required this.activeDates,
  });

  final String title;
  final int reward;
  final int entryCost;
  final String desc;
  final String activeDates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$reward',
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      BoneIcon.bone,
                      size: 25,
                    ),
                  ],
                ),
                const Text(
                  'REWARD',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'JOIN - $entryCost ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            BoneIcon.bone,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  activeDates,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChallengeCardHistorical extends StatelessWidget {
  const ChallengeCardHistorical({
    super.key,
    required this.title,
    required this.reward,
    required this.desc,
    required this.activeDates,
    required this.totalParticipants,
    required this.successRate,
  });

  final String title;
  final int reward;
  final String desc;
  final String activeDates;
  final int totalParticipants;
  final int successRate;

  @override
  Widget build(BuildContext context) {
    String totalParticipantsShort;

    if (totalParticipants >= 1000) {
      totalParticipantsShort = '${(totalParticipants / 1000).round()}K+';
    } else {
      totalParticipantsShort = '$totalParticipants';
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$reward',
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      BoneIcon.bone,
                      size: 25,
                    )
                  ],
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  '$totalParticipantsShort Total Participants',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$successRate% Success Rate',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  activeDates,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
