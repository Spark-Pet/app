import 'package:flutter/material.dart';

import '../domain/accessory_data.dart';

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
