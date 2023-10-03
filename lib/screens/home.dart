import 'package:flutter/material.dart';

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
            const Text('124'),
            const SizedBox(height: 40),
            const ProgressBar(),
            const SizedBox(height: 6),
            const ProgressBar(),
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
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: 0.88,
                    strokeWidth: 10,
                    backgroundColor: Color(0xffdddddd),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: 0.72,
                    strokeWidth: 10,
                    backgroundColor: Color(0xffdddddd),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xffe8b100)),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: 0.7,
                    strokeWidth: 10,
                    backgroundColor: Color(0xffdddddd),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
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
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Feed',
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