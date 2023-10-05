import 'package:flutter/material.dart';
import 'package:spark_pet/components/closet/closet_switch.dart';

class ClosetScreen extends StatefulWidget {
  const ClosetScreen({super.key});

  final String title = 'Closet/Store';

  @override
  State<ClosetScreen> createState() => _ClosetState();
}

class _ClosetState extends State<ClosetScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.only(left: 26, right: 26, top: 40),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ClosetSwitchButton(),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 2
                            ),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image: AssetImage('assets/images/accessories/hat-cowboy.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                'Cowboy Hat',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}