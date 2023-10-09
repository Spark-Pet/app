import 'package:flutter/material.dart';

class LeaderboardModal extends StatelessWidget {
  const LeaderboardModal({
    super.key,
    required this.username,
    required this.joinDate,
    required this.level,
    required this.currentStreak,
    required this.imageSrc,
  });

  final String username;
  final String joinDate;
  final String level;
  final String currentStreak;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                username,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Member since $joinDate',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(imageSrc),
                  width: 120,
                  height: 120,
                ),
              ),
              Text(
                'Level $level',
              ),
              Text(
                'Current Streak: $currentStreak',
              )
            ],
          ),
        )
    );
  }
}