import 'package:flutter/material.dart';

class ClosetSwitchButton extends StatefulWidget {
  const ClosetSwitchButton({super.key});

  @override
  State<ClosetSwitchButton> createState() => _SwitchState();
}

class _SwitchState extends State<ClosetSwitchButton> {
  bool showCloset = true;
  var textValue = 'Closet';

  void toggleSwitch(bool value) {
    setState(() {
      showCloset = !showCloset;
      textValue = showCloset ? 'Closet' : 'Store';
    });
  }
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
                      toggleSwitch(showCloset);
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
                      toggleSwitch(showCloset);
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
