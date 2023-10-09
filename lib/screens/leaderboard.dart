import 'package:flutter/material.dart';

class SixteenBoldVCentered extends StatelessWidget {
  const SixteenBoldVCentered(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SixteenVCentered extends StatelessWidget {
  const SixteenVCentered(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

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
                TableRow(
                  children: [
                    SixteenBoldVCentered(''),
                    SixteenBoldVCentered('Username'),
                    SixteenBoldVCentered('Steps'),
                  ],
                ),
                clickableTableRow(
                  children: [
                    SixteenBoldVCentered('1'),
                    SixteenVCentered('username1'),
                    SixteenVCentered('24,012'),
                  ],
                  onTap: () {
                    notifyParent(Container(
                      height: 270,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 15,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'username1',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Member since October 2023',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage('assets/images/dog.png'),
                                  width: 120,
                                  height: 120,
                              ),
                            ),
                            Text(
                              'Level 5',
                            ),
                            Text(
                              'Current Streak: 20 days',
                            )
                          ],
                        ),
                      )
                    ));
                  },
                ),
                clickableTableRow(
                  children: [
                    SixteenBoldVCentered('2'),
                    SixteenVCentered('username2'),
                    SixteenVCentered('23,847'),
                  ],
                  onTap: () {
                    print('Row 2 clicked');
                  },
                ),
                clickableTableRow(
                  children: [
                    SixteenBoldVCentered('3'),
                    SixteenVCentered('username3'),
                    SixteenVCentered('23,251'),
                  ],
                  onTap: () {
                    print('Row 3 clicked');
                  },
                ),
                clickableTableRow(
                  children: [
                    SixteenBoldVCentered('4'),
                    SixteenVCentered('username4'),
                    SixteenVCentered('22,616'),
                  ],
                  onTap: () {
                    print('Row 4 clicked');
                  },
                ),
                clickableTableRow(
                  children: [
                    SixteenBoldVCentered('5'),
                    SixteenVCentered('username5'),
                    SixteenVCentered('21,913'),
                  ],
                  onTap: () {
                    print('Row 5 clicked');
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