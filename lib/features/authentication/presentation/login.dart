import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';
import 'package:spark_pet/features/authentication/presentation/verify_email_view.dart';
import 'package:spark_pet/features/main_screen.dart';

import 'forgot_password_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            ForgotPasswordView.routeName,
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (!state.credential.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          if (!state.user.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          }
        }),
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            action == AuthAction.signIn
                ? 'Please sign in.'
                : 'Please create an account.',
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
