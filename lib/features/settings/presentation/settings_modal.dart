import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/settings_db.dart';

class SettingsModal extends ConsumerWidget {
  const SettingsModal({ super.key });

  void updateThemeMode(ThemeMode? newThemeMode, WidgetRef ref) {
    if (newThemeMode == null) return;
    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == ref.read(currentThemeModeProvider)) return;
    // Otherwise, store the new ThemeMode in memory
    ref.read(currentThemeModeProvider.notifier).setThemeMode(newThemeMode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        print('close settings modal');
                        // ref.read(showMainModalProvider.notifier).state = false;
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
                        // todo set current user id to null?
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
