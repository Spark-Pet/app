import 'package:flutter/material.dart';

import '../models/accessory_data.dart';
import '../models/user_data.dart';

class ClosetItem extends StatelessWidget {
  final AccessoryData accessoryData;

  const ClosetItem({super.key, required this.accessoryData});

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
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
            child: const Center(
              child: Text(
                'EQUIP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClosetScreen extends StatefulWidget {
  const ClosetScreen({super.key});

  @override
  State<ClosetScreen> createState() => _ClosetState();
}

class _ClosetState extends State<ClosetScreen> {
  final List<AccessoryData> _purchasedAccessories = accessoryDb.getAllAccessoriesById(userDb.getUser(currentUserId).purchasedAccessoryIds);

  @override
  Widget build(BuildContext context) {
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
                itemCount: _purchasedAccessories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClosetItem(
                    accessoryData: _purchasedAccessories[index],
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
