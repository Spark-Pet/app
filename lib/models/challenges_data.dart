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
  });

  String id;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  int costEntry;
  int reward;
  Function(int, List<int>) requirement;
}

class ChallengesDb {
  final List<ChallengesData> _challenges = [
    ChallengesData(
      id: 'challenge-001',
      name: '10K in a Day',
      description: 'Run, walk, or crawl 10,000 steps in a single day.',
      startDate: DateTime(2023, 10, 10),
      endDate: DateTime(2023, 10, 7),
      costEntry: 25,
      reward: 100,
      requirement: (_, steps) {
        for (int i = 0; i < steps.length; i++) {
          if (steps[i] > 10000) {
            return true;
          }
        }
        return false;
      },
    ),
    ChallengesData(
      id: 'challenge-002',
      name: 'Hat Trick',
      description: 'Exceed your steps goal by 50% for three days in a row.',
      startDate: DateTime(2023, 10, 1),
      endDate: DateTime(2023, 10, 31),
      costEntry: 50,
      reward: 250,
      requirement: (stepsGoal, steps) {
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
    ),
  ];

  ChallengesData getChallenge(String challengeId) {
    return _challenges.firstWhere((data) => data.id == challengeId);
  }
}

ChallengesDb challengesDb = ChallengesDb();
