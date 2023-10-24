import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengesData {
  ChallengesData({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.costEntry,
    required this.reward,
    required this.requirement,
    required this.totalParticipants,
    required this.successfulParticipants,
  });

  String id;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  int costEntry;
  int reward;
  int totalParticipants;
  int successfulParticipants;
  Function(int, int, List<int>) requirement; // stepGoal, streak, steps
}

class ChallengesDb {
  final List<ChallengesData> _challenges = [
    ChallengesData(
      id: 'challenge-001',
      name: '10K in a Day',
      description: 'Run, walk, or crawl 10,000 steps in a single day.',
      startDate: DateTime(2023, 10, 15),
      endDate: DateTime(2023, 10, 31),
      costEntry: 25,
      reward: 100,
      requirement: (stepsGoal, streak, steps) {
        for (int i = 0; i < steps.length; i++) {
          if (steps[i] > 10000) {
            return true;
          }
        }
        return false;
      },
      totalParticipants: 0,
      successfulParticipants: 0,
    ),
    ChallengesData(
      id: 'challenge-002',
      name: 'Hat Trick',
      description: 'Exceed your steps goal by 50% for three days in a row.',
      startDate: DateTime(2023, 10, 1),
      endDate: DateTime(2023, 10, 31),
      costEntry: 50,
      reward: 250,
      requirement: (stepsGoal, streak, steps) {
        int daysInRow = 0;
        for (int i = 0; i < steps.length; i++) {
          if (steps[i] >= stepsGoal * 1.5) {
            daysInRow++;
          } else {
            daysInRow = 0;
          }
          if (daysInRow == 3) {
            return true;
          }
        }
        return false;
      },
      totalParticipants: 0,
      successfulParticipants: 0,
    ),
    ChallengesData(
      id: 'challenge-003',
      name: 'No Rest For the Weary',
      description: 'Meet your steps goal every day for the entire month of September.',
      startDate: DateTime(2023, 9, 1),
      endDate: DateTime(2023, 9, 30),
      costEntry: 100,
      reward: 500,
      requirement: (stepsGoal, streak, steps) {
        // this needs work
        if (DateTime.now().month == 9 && DateTime.now().day == 30 && streak >= 30) {
          return true;
        }
        return false;
      },
      totalParticipants: 15030,
      successfulParticipants: 9201,
    )
  ];

  ChallengesData getChallenge(String challengeId) {
    return _challenges.firstWhere((data) => data.id == challengeId);
  }

  List<ChallengesData> getActiveChallenges() {
    return _challenges.where((data) => data.endDate.isAfter(DateTime.now())).toList();
  }

  List<ChallengesData> getHistoricalChallenges() {
    return _challenges.where((data) => data.endDate.isBefore(DateTime.now())).toList();
  }
}

final Provider<ChallengesDb> challengesDbProvider = Provider<ChallengesDb>((_) => ChallengesDb());
