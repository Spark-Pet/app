import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pet_statistics/data/pet_stats_provider.dart';
import '../../pet_statistics/domain/pet_stats.dart';
import '../../common/domain/constants.dart';
import '../../user/data/user_providers.dart';
import '../../user/domain/user_data.dart';

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

class UserStats {
  UserStats({
    required this.userId,
    required this.steps,
    required this.dailyStepsGoal,
    required this.currentStreakDays,
  });

  String userId;
  List<int> steps; // steps[6] is always today, steps[0] is 6 days ago
  int dailyStepsGoal;
  int currentStreakDays;
}

class UserStatsDb {
  final ProviderRef<UserStatsDb> ref;
  final List<UserStats> _stats = [
    UserStats(
      userId: 'user-001',
      steps: [2403, 1230, 4310, 3551, 4530, 1023, 3039],
      dailyStepsGoal: 3000,
      currentStreakDays: 1,
    ),
    UserStats(
      userId: 'user-002',
      steps: [3042, 3932, 3029, 3351, 3519, 3012, 3018],
      dailyStepsGoal: 3000,
      currentStreakDays: 13,
    ),
    UserStats(
      userId: 'user-003',
      steps: [2403, 1230, 4310, 3921, 4530, 3551, 4212],
      dailyStepsGoal: 3000,
      currentStreakDays: 5,
    ),
  ];

  UserStatsDb(this.ref);

  UserStats getStats(String userId) {
    return _stats.firstWhere((data) => data.userId == userId);
  }

  List<StatsForLeaderboard> getTodaysTopFifty() {
    final PetStatsDb petDb = ref.watch(petStatsDbProvider);
    final UserDb userDb = ref.watch(userDbProvider);
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
