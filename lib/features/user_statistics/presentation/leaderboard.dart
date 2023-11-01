import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/user_statistics/domain/user_stats.dart';

import 'leaderboard_modal.dart';
import 'leaderboard_table_text.dart';
import '../../../sparkpet.dart';
import '../data/user_stats_provider.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

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
    final List<StatsForLeaderboard> leaderboard = ref.watch(userStatsDbProvider).getTodaysTopFifty();

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
                ...(leaderboard.map((info) => clickableTableRow(
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
