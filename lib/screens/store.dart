import 'package:flutter/material.dart';

import '../components/store/store_item.dart';
import '../models/accessory_data.dart';
import '../models/user_data.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreState();
}

class _StoreState extends State<StoreScreen> {
  final List<AccessoryData> _allAccessories = accessoryDb.getAllAccessoriesExcept(userDb.getUser(currentUserId).purchasedAccessoryIds);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
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
                itemCount: _allAccessories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return StoreItem(
                    accessoryData: _allAccessories[index],
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
