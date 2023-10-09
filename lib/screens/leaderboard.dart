import 'package:flutter/material.dart';

import '../components/leaderboard/leaderboard_modal.dart';
import '../components/leaderboard/leaderboard_table_text.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key, required this.notifyParent});

  final String title = 'Leaderboards';
  final Function(Container) notifyParent;

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
                clickableTableRow(
                  children: [
                    const LeaderboardTitleText('1'),
                    const LeaderboardRegText('username1'),
                    const LeaderboardRegText('24,012'),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      child: const LeaderboardModal(
                        username: 'username1',
                        joinDate: 'Oct 1, 2023',
                        level: '5',
                        currentStreak: '3 days',
                        imageSrc: 'assets/images/dog.png',
                      ),
                    ));
                  },
                ),
                clickableTableRow(
                  children: [
                    const LeaderboardTitleText('2'),
                    const LeaderboardRegText('username2'),
                    const LeaderboardRegText('23,847'),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      child: const LeaderboardModal(
                        username: 'username2',
                        joinDate: 'Oct 1, 2023',
                        level: '5',
                        currentStreak: '3 days',
                        imageSrc: 'assets/images/dog.png',
                      ),
                    ));
                  },
                ),
                clickableTableRow(
                  children: [
                    const LeaderboardTitleText('3'),
                    const LeaderboardRegText('username3'),
                    const LeaderboardRegText('23,251'),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      child: const LeaderboardModal(
                        username: 'username3',
                        joinDate: 'Oct 2, 2023',
                        level: '5',
                        currentStreak: '6 days',
                        imageSrc: 'assets/images/dog.png',
                      ),
                    ));
                  },
                ),
                clickableTableRow(
                  children: [
                    const LeaderboardTitleText('4'),
                    const LeaderboardRegText('username4'),
                    const LeaderboardRegText('22,616'),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      child: const LeaderboardModal(
                        username: 'username4',
                        joinDate: 'Oct 5, 2023',
                        level: '2',
                        currentStreak: '4 days',
                        imageSrc: 'assets/images/dog.png',
                      ),
                    ));
                  },
                ),
                clickableTableRow(
                  children: [
                    const LeaderboardTitleText('5'),
                    const LeaderboardRegText('username5'),
                    const LeaderboardRegText('21,913'),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      child: const LeaderboardModal(
                        username: 'username5',
                        joinDate: 'Oct 2, 2023',
                        level: '3',
                        currentStreak: '3 days',
                        imageSrc: 'assets/images/dog.png',
                      ),
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}