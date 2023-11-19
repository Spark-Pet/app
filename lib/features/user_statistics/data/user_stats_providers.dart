import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user_stats.dart';
import 'user_stats_database.dart';

part 'user_stats_providers.g.dart';

@riverpod
UserStatsDatabase userStatsDatabase(UserStatsDatabaseRef ref) {
  return UserStatsDatabase(ref);
}

@riverpod
Stream<List<UserStats>> userStats(UserStatsRef ref) {
  final database = ref.watch(userStatsDatabaseProvider);
  return database.watchAllUserStats();
}
