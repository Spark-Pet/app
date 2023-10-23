import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/sparkpet.dart';

void main() {
  runApp(const ProviderScope(child: SparkPetApp()));
}

class SparkPetApp extends StatelessWidget {
  const SparkPetApp({super.key});

  // Root of application
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SparkPet());
  }
}
