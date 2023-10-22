import 'package:flutter/material.dart';

import '../icons/bone_icon.dart';
import '../models/accessory_data.dart';
import '../models/user_data.dart';

class StoreItem extends StatelessWidget {
  final AccessoryData accessoryData;

  const StoreItem({super.key, required this.accessoryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image(
                    image: AssetImage(accessoryData.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                Text(
                  accessoryData.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    accessoryData.price.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Center(
                  child: Icon(
                    BoneIcon.bone,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
