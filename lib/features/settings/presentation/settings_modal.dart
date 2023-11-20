import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/authentication/presentation/login.dart';

import '../../main_screen.dart';
import '../data/settings_db.dart';

class SettingsModal extends ConsumerWidget {
  const SettingsModal({ super.key });

  void updateThemeMode(ThemeMode? newThemeMode, WidgetRef ref) {
    if (newThemeMode == null || newThemeMode == ref.read(currentThemeModeProvider)) {
      return;
    }
    ref.read(currentThemeModeProvider.notifier).setThemeMode(newThemeMode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: ref.watch(currentThemeModeProvider) == ThemeMode.dark ?
              const Color(0xFF333333) : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30, right: 30, top: 15, bottom: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        ref.read(showMainModalProvider.notifier).state = false;
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: ref.watch(currentThemeModeProvider) == ThemeMode.dark,
                      onChanged: (bool darkModeOn) {
                        darkModeOn ?
                          updateThemeMode(ThemeMode.dark, ref) :
                          updateThemeMode(ThemeMode.light, ref);
                      },
                    ),
                  ]
                ),
                Row(
                  children: [
                    const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        FirebaseUIAuth.signOut();
                        ref.read(showMainModalProvider.notifier).state = false;
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                    ),
                  ],
                )
              ]
            ),
          ),
      ),
    );
  }
}
