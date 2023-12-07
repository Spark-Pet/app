import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spark_pet/features/authentication/presentation/login.dart';
import 'package:spark_pet/features/main_screen.dart';
import 'package:spark_pet/features/page_not_found.dart';

import 'features/authentication/presentation/forgot_password_view.dart';
import 'features/authentication/presentation/verify_email_view.dart';
import 'features/settings/data/settings_db.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

  var status = await Permission.activityRecognition.status;
  if (!status.isGranted) {
    await Permission.activityRecognition.request();
  }

  runApp(const ProviderScope(child: SparkPetApp()));
}

class SparkPetApp extends ConsumerWidget {
  const SparkPetApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(currentThemeModeProvider),
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: (RouteSettings routeSettings) {
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
              case MainScreen.routeName:
                return const MainScreen();
              default:
                return const PageNotFound();
            }
          },
        );
      },
    );
  }
}
