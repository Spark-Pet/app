import 'package:spark_pet/models/pet_data.dart';
import 'package:spark_pet/models/user_data.dart';

import '../util/constants.dart';

class StatsForLeaderboard {
  StatsForLeaderboard({
    required this.place,
    required this.username,
    required this.steps,
    required this.currentStreakDays,
    required this.currentLevel,
    required this.joinDate,
    required this.equippedAccessories,
  });

  int place;
  String username;
  int steps;
  int currentStreakDays;
  int currentLevel;
  String joinDate;
  List<String> equippedAccessories;
}

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
      steps: [3042, 3932, 3029, 3351, 3519, 3012, 3018],
      currentStreakDays: 13,
    ),
    StatsData(
      userId: 'user-003',
      steps: [2403, 1230, 4310, 3921, 4530, 3551, 4212],
      currentStreakDays: 5,
    ),
  ];

  StatsData getStats(String userId) {
    return _stats.firstWhere((data) => data.userId == userId);
  }

  List<StatsForLeaderboard> getTodaysTopFifty() {
    final List<StatsForLeaderboard> topFifty = [];
    _stats.sort((a, b) => b.steps[6].compareTo(a.steps[6]));
    for (var i = 0; i < _stats.length && i < 50; i++) {
      final userInfo = userDb.getUser(_stats[i].userId);
      final petInfo = petDb.getPet(userInfo.petId);
      topFifty.add(StatsForLeaderboard(
        place: i + 1,
        username: userInfo.username,
        steps: _stats[i].steps[6],
        currentStreakDays: _stats[i].currentStreakDays,
        currentLevel: petInfo.currentLevel,
        joinDate: '${Constants.getFullMonth(userInfo.dateJoined.month)} ${userInfo.dateJoined.year}',
        equippedAccessories: petInfo.equippedAccessoryIds,
      ));
    }
    return topFifty;
  }
}

StatsDb statsDb = StatsDb();
