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

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  final String title = 'Leaderboards';

  @override
  State<LeaderboardScreen> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<LeaderboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                children: const [
                  TableRow(
                    children: [
                      SizedBox(),
                      SixteenBoldVCentered('Name'),
                      SixteenBoldVCentered('Total Steps'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('1'),
                      SixteenVCentered('username1'),
                      SixteenVCentered('24,012'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('2'),
                      SixteenVCentered('username2'),
                      SixteenVCentered('23,963'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('3'),
                      SixteenVCentered('username3'),
                      SixteenVCentered('22,146'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('4'),
                      SixteenVCentered('username4'),
                      SixteenVCentered('16,754'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('5'),
                      SixteenVCentered('username5'),
                      SixteenVCentered('15,243'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('6'),
                      SixteenVCentered('username6'),
                      SixteenVCentered('14,599'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}