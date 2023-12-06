import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spark_pet/features/authentication/presentation/login.dart';
import 'package:spark_pet/features/main_screen.dart';
import 'package:spark_pet/features/page_not_found.dart';
import 'package:spark_pet/features/vito_loading.dart';

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

class SparkPetApp extends ConsumerStatefulWidget {
  const SparkPetApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SparkPetAppState();
}

class _SparkPetAppState extends ConsumerState<SparkPetApp> {
  int loginStatus = -1; // -1: not loaded, 0: not logged in, 1: logged in

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null && loginStatus != 1) {
        print("User is signed in");
        setState(() { loginStatus = 1; });
      } else if (user == null && loginStatus != 0){
        print("User is signed out");
        setState(() { loginStatus = 0; });
      }
    });

    if (loginStatus == -1) {
      return const MaterialApp(
        title: 'SparkPet',
        home: Scaffold(
          body: Center(
            child: VitoLoading(),
          ),
        ),
      );
    }

    if (loginStatus == 0) {
      return const MaterialApp(
        title: 'SparkPet',
        home: LoginScreen(),
      );
    }

    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(currentThemeModeProvider),
      initialRoute: loginStatus == 1 ? MainScreen.routeName : LoginScreen.routeName,
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
