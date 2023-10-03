import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.progressBarColor,
    required this.title,
    required this.currentProgress,
    required this.progressTotal,
  }) : super(key: key);
  final Color progressBarColor;
  final String title;
  final int currentProgress;
  final int progressTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: currentProgress / progressTotal,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: progressBarColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}