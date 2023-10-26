import 'package:flutter/material.dart';

import '../icons/bone_icon.dart';

class BoneCountPill extends StatelessWidget {
  final int bonesCount;

  const BoneCountPill({
    super.key,
    required this.bonesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 80,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Row(
              children: [
                Text(
                  bonesCount.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  BoneIcon.bone,
                  size: 20,
                  color: Colors.white,
                ),
              ]
          )
        ]
    );
  }
}