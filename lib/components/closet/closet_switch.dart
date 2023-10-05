import 'package:flutter/material.dart';

class ClosetSwitchButton extends StatelessWidget {
  const ClosetSwitchButton({
    super.key,
    required this.showCloset,
    required this.toggleSwitch,
  });
  final bool showCloset;
  final Function toggleSwitch;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 4),
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
                  InkWell(
                    child: Text(
                      'My Items',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                    onTap: () {
                      toggleSwitch(true);
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        'Store',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    onTap: () {
                      toggleSwitch(false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: showCloset ? Alignment.centerLeft : Alignment.centerRight,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Container (
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  showCloset ? 'My Items' : 'Store',
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
    );
  }
}
