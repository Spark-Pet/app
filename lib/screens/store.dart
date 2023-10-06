import 'package:flutter/material.dart';
import 'package:spark_pet/components/closet/store_grid.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  final String title = 'Store';

  @override
  State<StoreScreen> createState() => _StoreState();
}

class _StoreState extends State<StoreScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Store',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 26, right: 26),
              child: StoreGrid(),
            ),
          ],
        ),
      ),
    );
  }
}