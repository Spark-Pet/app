import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    super.key,
    required this.progressBarColor,
    required this.title,
    required this.currentProgress,
    required this.goal,
    required this.round,
  });
  final Color progressBarColor;
  final String title;
  final int currentProgress;
  final double goal;
  final bool round; // whether or not to round the display

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: currentProgress / goal,
                strokeWidth: 9,
                backgroundColor: const Color(0xffdddddd),
                valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  round ? currentProgress.round().toString() : currentProgress.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ],
    );
  }
}
