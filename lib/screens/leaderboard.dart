import 'package:flutter/material.dart';
import 'package:spark_pet/models/stats_data.dart';

import '../components/leaderboard/leaderboard_modal.dart';
import '../components/leaderboard/leaderboard_table_text.dart';

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({super.key, required this.notifyParent});

  final Function(Container) notifyParent;

  final List<StatsForLeaderboard> _leaderboard = statsDb.getTodaysTopFifty();

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
  Widget build(BuildContext context) {
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
                ...(_leaderboard.map((info) => clickableTableRow(
                  children: [
                    LeaderboardRegText(info.place.toString()),
                    LeaderboardRegText(info.username),
                    LeaderboardRegText(info.steps.toString()),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      child: LeaderboardModal(
                        username: info.username,
                        joinDate: info.joinDate.toString(),
                        level: info.currentLevel.toString(),
                        currentStreak: info.currentStreakDays.toString(),
                        imageSrc: 'assets/images/dog.png', // todo change based on equipped accessories
                      ),
                    ));
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
