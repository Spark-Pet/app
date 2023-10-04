import 'package:flutter/material.dart';

class ClosetScreen extends StatefulWidget {
  const ClosetScreen({super.key});

  final String title = 'Closet/Store';

  @override
  State<ClosetScreen> createState() => _ClosetState();
}

class _ClosetState extends State<ClosetScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xffdddddd),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            const Text(
              'Closet/Store Screen',
            ),
          ],
        ),
      ),
    );
  }
}