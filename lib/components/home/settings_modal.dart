import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user_data.dart';
import '../../sparkpet.dart';

class SettingsModal extends ConsumerWidget {
  const SettingsModal({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        height: 270,
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
                    value: ref.watch(darkModeProvider),
                    onChanged: (bool value) {
                      ref.read(darkModeProvider.notifier).state = value;
                    },
                  ),
                ]
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  ref.read(currentUserIDProvider.notifier).state = '';
                },
              )
            ]
          ),
        ),
    );
  }
}
