import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/accessory/domain/accessory_data.dart';
import 'package:spark_pet/features/authentication/presentation/login.dart';
import 'package:spark_pet/features/challenge/domain/challenge_data.dart';
import 'package:spark_pet/features/page_not_found.dart';
import 'package:spark_pet/features/pet_statistics/domain/pet_stats.dart';
import 'package:spark_pet/features/user/domain/user_data.dart';

import 'features/accessory/presentation/closet.dart';
import 'features/accessory/presentation/store.dart';
import 'features/authentication/presentation/forgot_password_view.dart';
import 'features/authentication/presentation/verify_email_view.dart';
import 'features/challenge/presentation/challenges.dart';
import 'features/home/presentation/home.dart';
import 'features/settings/data/settings_db.dart';
import 'features/user_statistics/presentation/leaderboard.dart';
import 'firebase_options.dart';

// Check that Freezed data models and json data files are compatible.
Future<bool> verifyInitialData() async {
  // logger.i('Verifying initial data files: Chapter, Garden, News, User');
  await UserData.checkInitialData();
  /*
  await UserStats.checkInitialData();
  await PetStats.checkInitialData();
  await AccessoryData.checkInitialData();
  await ChallengeData.checkInitialData();
   */
  return true;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await verifyInitialData();
  runApp(const ProviderScope(child: SparkPetApp()));
}

class SparkPetApp extends ConsumerWidget {
  const SparkPetApp({super.key});

  // Root of application
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('uhhhh');
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
            .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ref.watch(currentThemeModeProvider),
      onGenerateRoute: (RouteSettings routeSettings) {
        print('route: $routeSettings');
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case LoginScreen.routeName:
                return const LoginScreen();
              case VerifyEmailView.routeName:
                return const VerifyEmailView();
              case ForgotPasswordView.routeName:
                return const ForgotPasswordView();
              case HomeScreen.routeName:
                return const HomeScreen();
              case StoreScreen.routeName:
                return const StoreScreen();
              case ClosetScreen.routeName:
                return const ClosetScreen();
              case LeaderboardScreen.routeName:
                return const LeaderboardScreen();
              case ChallengesScreen.routeName:
                return const ChallengesScreen();
              default:
                return const PageNotFound();
            }
          },
        );
      },
    );
  }
}
