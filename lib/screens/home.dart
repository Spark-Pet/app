import 'package:flutter/material.dart';
import 'package:spark_pet/components/home/circular_progress.dart';
import 'package:spark_pet/icons/bone_icon.dart';
import 'package:spark_pet/models/pet_data.dart';

import '../components/home/progress_bar.dart';
import '../models/stats_data.dart';
import '../models/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final UserData _user = userDb.getUser(currentUserId);
  final PetData _pet = petDb.getPetByOwnerId(currentUserId);
  final StatsData _stats = statsDb.getStats(currentUserId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _user.bones.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          BoneIcon.bone,
                          size: 20,
                          color: Colors.white,
                        ),
                      ]
                    )
                  ]
                )
              ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Expanded(child: ProgressBar(
                  progressBarColor: Color(0xffe1ab3c),
                  title: 'Level ${_pet.currentLevel}',
                  currentProgress: _pet.progressNextLevel,
                  progressTotal: 100,
                )),
                SizedBox(width: 10),
                Expanded(child: ProgressBar(
                  progressBarColor: Color(0xffe82c40),
                  title: 'HP ${_pet.hpCurrent}/${_pet.hpTotal}',
                  currentProgress: _pet.hpCurrent,
                  progressTotal: _pet.hpTotal,
                )),
              ],
            ),
            const SizedBox(height: 6),
            const Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Image(
                      image: AssetImage('assets/images/dog.png'),
                      width: 180,
                      height: 180
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Image(
                        image: AssetImage('assets/images/dish.png'),
                        width: 100,
                        height: 100
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CircularProgress(
              progressBarColor: Color(0xff1d8eec),
              title: "Steps",
              currentProgress: _stats.steps[6].toDouble(),
              goal: _stats.dailyStepsGoal.toDouble(),
              round: true,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'FILL BOWL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
