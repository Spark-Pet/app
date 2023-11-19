import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'accessory/data/accessory_providers.dart';
import 'accessory/domain/accessory_data.dart';
import 'challenge/data/challenge_providers.dart';
import 'challenge/domain/challenge_data.dart';
import 'pet_statistics/data/pet_stats_providers.dart';
import 'pet_statistics/domain/pet_stats.dart';
import 'user_statistics/data/user_stats_providers.dart';
import 'user_statistics/domain/user_stats.dart';
import 'user/data/user_providers.dart';
import 'user/domain/user_data.dart';

part 'all_data_provider.g.dart';

class AllData {
  AllData({
    required this.accessories,
    required this.challenges,
    required this.petStats,
    required this.userStats,
    required this.userData,
    required this.currentUserId,
  });

  final List<AccessoryData> accessories;
  final List<ChallengeData> challenges;
  final List<PetStats> petStats;
  final List<UserStats> userStats;
  final List<UserData> userData;
  final String currentUserId;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final accessories = ref.watch(accessoriesProvider.future);
  final challenges = ref.watch(challengesProvider.future);
  final petStats = ref.watch(petStatsProvider.future);
  final userStats = ref.watch(userStatsProvider.future);
  final userData = ref.watch(usersProvider.future);
  final currentUserId = ref.watch(currentUserIdProvider);
  return AllData(
      accessories: await accessories,
      challenges: await challenges,
      petStats: await petStats,
      userStats: await userStats,
      userData: await userData,
      currentUserId: currentUserId);
}
