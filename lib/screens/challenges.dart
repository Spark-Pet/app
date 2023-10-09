import 'package:flutter/material.dart';

import '../components/challenges/challenge_switch.dart';
import '../components/leaderboard/leaderboard_table_text.dart';
import '../icons/bone_icon.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesState();
}

class _ChallengesState extends State<ChallengesScreen> {
  bool showActive = true; // active challenges vs historical challenges

  void refreshState(bool newShowActive) {
    setState(() {
      showActive = newShowActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          const Text(
            'Challenges',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: ChallengesSwitchButton(
              showActive: showActive,
              toggleSwitch: refreshState,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '10k Steps, 1 Day',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '100',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              BoneIcon.bone,
                              size: 25,
                            ),
                          ],
                        ),
                        Text(
                          'REWARD',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Walk, run, or crawl a total of 10,000 steps in a single day.',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'JOIN - 25 ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                   ),
                                  Icon(
                                    BoneIcon.bone,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '10 - 17 Oct 2023',
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
