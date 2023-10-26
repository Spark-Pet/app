import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/components/bone_count_pill.dart';

import '../components/store/store_item.dart';
import '../models/accessory_data.dart';
import '../models/user_data.dart';

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int bonesCount = ref.watch(userDbProvider).getUser(ref.watch(currentUserIDProvider)).bones;
    final List<String> userAccessories = ref.watch(userDbProvider).getUser(ref.watch(currentUserIDProvider)).purchasedAccessoryIds;
    final List<AccessoryData> accessories = ref.watch(accessoryDbProvider).getAllAccessoriesExcept(userAccessories);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BoneCountPill(bonesCount: bonesCount)
              ],
            ),
            const Text(
              'Store',
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
                itemCount: accessories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return StoreItem(
                    accessoryData: accessories[index],
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
