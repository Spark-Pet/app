import 'package:flutter/material.dart';
import 'package:spark_pet/components/closet/closet_switch.dart';
import 'package:spark_pet/components/closet/store_grid.dart';

import '../components/closet/closet_grid.dart';

class ClosetStoreScreen extends StatefulWidget {
  const ClosetStoreScreen({super.key});

  final String title = 'Closet/Store';

  @override
  State<ClosetStoreScreen> createState() => _ClosetStoreState();
}

class _ClosetStoreState extends State<ClosetStoreScreen> {
  bool showCloset = true;

  void refreshState(bool newShowCloset) {
    setState(() {
      showCloset = newShowCloset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.only(left: 26, right: 26, top: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ClosetSwitchButton(
                  showCloset: showCloset,
                  toggleSwitch: refreshState,
                ),
              ),
              showCloset ? ClosetGrid() : StoreGrid(),
            ],
          ),
        ),
      ),
    );
  }
}