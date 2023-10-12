class StatsData {
  StatsData({
    required this.userId,
    required this.steps,
    required this.currentStreakDays,
  });

  String userId;
  List<int> steps; // steps[6] is always today, steps[0] is 6 days ago
  int currentStreakDays;
}

class StatsDb {
  final List<StatsData> _stats = [
    StatsData(
      userId: 'user-001',
      steps: [2403, 1230, 4310, 3551, 4530, 1023, 3039],
      currentStreakDays: 1,
    ),
    StatsData(
      userId: 'user-002',
      steps: [3042, 3932, 3029, 3351, 3519, 3012, 3039],
      currentStreakDays: 13,
    ),
    StatsData(
      userId: 'user-003',
      steps: [2403, 1230, 4310, 3921, 4530, 3551, 3039],
      currentStreakDays: 5,
    ),
  ];

  StatsData getStats(String userId) {
    return _stats.firstWhere((data) => data.userId == userId);
  }
}

StatsDb statsDb = StatsDb();
