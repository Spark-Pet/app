import 'package:spark_pet/sparkpet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SparkPetApp());
}

class SparkPetApp extends StatelessWidget {
  const SparkPetApp({super.key});

  // Root of application
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SparkPet());
  }
}
