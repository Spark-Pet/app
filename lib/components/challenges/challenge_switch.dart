import 'package:flutter/material.dart';

class ChallengesSwitchButton extends StatelessWidget {
  const ChallengesSwitchButton({
    super.key,
    required this.showActive,
    required this.toggleSwitch,
  });
  final bool showActive;
  final Function toggleSwitch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10), // align label in center
                      child: TextButton(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Active',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        onPressed: () {
                          toggleSwitch(true);
                        },
                      ),
                    ),
                    TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      onPressed: () {
                        toggleSwitch(false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: showActive ? Alignment.centerLeft : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container (
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    showActive ? 'Active' : 'Historical',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
