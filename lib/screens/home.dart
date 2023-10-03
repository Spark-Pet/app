import 'package:flutter/material.dart';
import 'package:spark_pet/components/home/circular_progress.dart';

import '../components/home/progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  final String title = 'Home';

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              '124',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Expanded(child: ProgressBar(
                  progressBarColor: Color(0xffe1ab3c),
                  title: "Level 5",
                  currentProgress: 5,
                  progressTotal: 10,
                )),
                SizedBox(width: 10),
                Expanded(child: ProgressBar(
                  progressBarColor: Color(0xffe82c40),
                  title: "HP",
                  currentProgress: 72,
                  progressTotal: 100,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                CircularProgress(
                  progressBarColor: Color(0xff1d8eec),
                  title: "Steps",
                  currentProgress: 1293.0,
                  goal: 2000.0,
                  round: true,
                ),
                CircularProgress(
                  progressBarColor: Color(0xfffdc50f),
                  title: "Calories",
                  currentProgress: 301.0,
                  goal: 500.0,
                  round: true,
                ),
                CircularProgress(
                  progressBarColor: Color(0xff0c8c31),
                  title: "Distance",
                  currentProgress: 2.1,
                  goal: 4.0,
                  round: false,
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}