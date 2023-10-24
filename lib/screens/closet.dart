import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/closet/closet_item.dart';
import '../models/accessory_data.dart';
import '../models/user_data.dart';

class ClosetScreen extends ConsumerWidget {
  const ClosetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> userAccessoryIds = ref.watch(userDbProvider).getUser(ref.watch(currentUserIDProvider)).purchasedAccessoryIds;
    final List<AccessoryData> purchasedAccessories = ref.watch(accessoryDbProvider).getAccessoriesById(userAccessoryIds);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Closet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: purchasedAccessories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClosetItem(
                    accessoryData: purchasedAccessories[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
