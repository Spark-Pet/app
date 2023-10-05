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

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  final String title = 'Exercise History';

  @override
  State<HistoryScreen> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Daily Average',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '(Past 7 Days)',
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/paw-prints.png'),
                      fit: BoxFit.contain,
                      width: 90,
                    ),
                    Text(
                      '6,560',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Steps'),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/fire.png'),
                      fit: BoxFit.contain,
                      width: 70,
                    ),
                    Text(
                      '302',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Calories'),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/distance.png'),
                      fit: BoxFit.contain,
                      width: 100,
                    ),
                    Text(
                      '2.1 mi',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Distance'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Text(
              'Stats',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1,
                ),
                children: const [
                  TableRow(
                    children: [
                      SixteenBoldVCentered('Date'),
                      SixteenBoldVCentered('Steps'),
                      SixteenBoldVCentered('Calories'),
                      SixteenBoldVCentered('Miles'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('10/3'),
                      SixteenVCentered('6,560'),
                      SixteenVCentered('302'),
                      SixteenVCentered('2.1'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('10/2'),
                      SixteenVCentered('6,560'),
                      SixteenVCentered('302'),
                      SixteenVCentered('2.1'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('10/1'),
                      SixteenVCentered('6,560'),
                      SixteenVCentered('302'),
                      SixteenVCentered('2.1'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('9/30'),
                      SixteenVCentered('6,560'),
                      SixteenVCentered('302'),
                      SixteenVCentered('2.1'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('9/29'),
                      SixteenVCentered('6,560'),
                      SixteenVCentered('302'),
                      SixteenVCentered('2.1'),
                    ],
                  ),
                  TableRow(
                    children: [
                      SixteenBoldVCentered('9/28'),
                      SixteenVCentered('6,560'),
                      SixteenVCentered('302'),
                      SixteenVCentered('2.1'),
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