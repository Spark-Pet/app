import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/sparkpet.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  runApp(const ProviderScope(child: SparkPetApp()));
}

class SparkPetApp extends StatelessWidget {
  const SparkPetApp({super.key});

  // Root of application
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    if (auth.currentUser == null || auth.currentUser!.isAnonymous) {
      return MaterialApp(
        title: 'SparkPet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: SafeArea(
            child: SignInScreen(),
          ),
        ),
      );
    }
    if (!auth.currentUser!.emailVerified && auth.currentUser!.email != null) {
      return MaterialApp(
        title: 'SparkPet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: SafeArea(
            child: EmailVerificationScreen(),
          ),
        ),
      );
    }
    return const SparkPet();
  }
}
