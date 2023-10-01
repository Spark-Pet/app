import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  final String title = 'Challenges';

  @override
  State<ChallengesScreen> createState() => _ChallengesState();
}

class _ChallengesState extends State<ChallengesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Challenges',
            ),
          ],
        ),
      ),
    );
  }
}