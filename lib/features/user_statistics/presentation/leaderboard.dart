import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/user/domain/user_data.dart';
import 'package:spark_pet/features/user_statistics/domain/user_stats.dart';

import '../../all_data_provider.dart';
import '../../main_screen.dart';
import '../../pet_statistics/domain/pet_stats.dart';
import '../../vito_error.dart';
import '../../vito_loading.dart';
import 'leaderboard_modal.dart';
import 'leaderboard_table_text.dart';

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

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  static const routeName = '/leaderboard';

  TableRow clickableTableRow({
    required List<Widget> children,
    required void Function() onTap,
  }) {
    return TableRow(
      children: children.map((child) {
        return GestureDetector(
          onTap: onTap,
          child: child,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
      data: (allData) => _build(
        context: context,
        currentUserEmail: allData.currentUserEmail,
        allUserStats: allData.userStats,
        allUserData: allData.userData,
        allPetStats: allData.petStats,
        ref: ref,
      ),
      loading: () => const VitoLoading(),
      error: (error, st) => VitoError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required String currentUserEmail,
    required List<UserStats> allUserStats,
    required List<UserData> allUserData,
    required List<PetStats> allPetStats,
    required WidgetRef ref,
  }) {
    // merge allUserStats, allPetStats, and allUserData based on userId
    final mergedUserStatsData = allUserStats.map((userStats) {
      final userData = allUserData.firstWhere((userData) => userData.id == userStats.userId);
      final petStats = allPetStats.firstWhere((petStats) => petStats.id == userData.petId);
      return StatsForLeaderboard(
        place: 0, // todo
        username: userData.username,
        steps: userStats.steps.reduce((a, b) => a + b),
        currentStreakDays: userStats.currentStreakDays,
        currentLevel: petStats.currentLevel,
        joinDate: userData.dateJoined.toString(),
        equippedAccessories: petStats.equippedAccessoryIds,
      );
    }).toList();
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          const Text(
            'Daily Leaderboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Thursday, Oct 5th'
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(4),
              },
              border: TableBorder.all(
                color: Colors.grey,
                width: 1,
              ),
              children: [
                const TableRow(
                  children: [
                    LeaderboardTitleText(''),
                    LeaderboardTitleText('Username'),
                    LeaderboardTitleText('Steps'),
                  ],
                ),
                ...(mergedUserStatsData.map((info) => clickableTableRow(
                  children: [
                    LeaderboardRegText(info.place.toString()),
                    LeaderboardRegText(info.username),
                    LeaderboardRegText(info.steps.toString()),
                  ],
                  onTap: () {
                    ref.read(showMainModalProvider.notifier).state = true;
                    ref.read(mainModalProvider.notifier).state = Container(
                      child: LeaderboardModal(
                        username: info.username,
                        joinDate: info.joinDate.toString(),
                        level: info.currentLevel.toString(),
                        currentStreak: info.currentStreakDays.toString(),
                        imageSrc: 'assets/images/dog.png', // todo change based on equipped accessories
                      ),
                    );
                  },
                )).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
