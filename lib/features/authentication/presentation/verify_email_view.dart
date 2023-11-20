import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:spark_pet/features/authentication/presentation/login.dart';

import '../../main_screen.dart';
import 'decorations.dart';

/// Builds the page to support email verification.
class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  static const routeName = '/verify-email';

  @override
  Widget build(BuildContext context) {
    return EmailVerificationScreen(
      headerBuilder: headerIcon(Icons.verified),
      sideBuilder: sideIcon(Icons.verified),
      actions: [
        EmailVerifiedAction(() {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }),
        AuthCancelledAction((context) {
          FirebaseUIAuth.signOut(context: context);
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }),
      ],
    );
  }
}
