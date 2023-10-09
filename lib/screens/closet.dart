import 'package:flutter/material.dart';

import '../components/closet/closet_grid.dart';

class ClosetScreen extends StatefulWidget {
  const ClosetScreen({super.key});

  @override
  State<ClosetScreen> createState() => _ClosetState();
}

class _ClosetState extends State<ClosetScreen> {
  bool showCloset = true;

  void refreshState(bool newShowCloset) {
    setState(() {
      showCloset = newShowCloset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Closet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 26, right: 26),
              child: ClosetGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
