import 'package:flutter/material.dart';
import '../icons/spark_icons.dart';

class NavBarButton extends StatelessWidget {
  /// A button for the navigation bar (below)
  NavBarButton({
    super.key,
    required this.icon,
    required this.size,
    required this.onPressed,
    required this.currentPageIndex,
    required this.thisPageIndex,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
  });

  final IconData icon;
  final double size;
  final int currentPageIndex;
  final int thisPageIndex;
  final Function onPressed;

  double topPadding;
  double bottomPadding;
  double leftPadding;
  double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (currentPageIndex == thisPageIndex) ? Colors.blue[300] : Colors.transparent,
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          child: Padding(
            padding: EdgeInsets.only(
              top: (-size / 2).round() + 25 + topPadding,       // adjust padding based on size -
              bottom: (-size / 2).round() + 25 + bottomPadding, // smaller icon size will result in larger padding,
              left: (-size / 2).round() + 25 + leftPadding,     // so all buttons have the same overall size
              right: (-size / 2).round() + 25 + rightPadding,
            ),
            child: Icon(
              icon,
              size: size,
              color: Colors.black,
            ),
          ),
          onTap: () {
            onPressed(thisPageIndex);
          },
        ),
      ),
    );
  }
}

class SparkPetNavBar extends StatelessWidget {
  /// Custom nav bar for app
  const SparkPetNavBar({super.key, required this.currentPageIndex, required this.notifyParent});

  final int currentPageIndex;
  final Function(int) notifyParent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 66,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xffe9e9e9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8), // extra space on outside
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NavBarButton(
                      icon: SparkIcons.history,
                      size: 32,
                      onPressed: notifyParent,
                      currentPageIndex: currentPageIndex,
                      thisPageIndex: 0,
                      bottomPadding: 9,
                      leftPadding: 3,
                    ),
                    NavBarButton(
                      icon: SparkIcons.hanger,
                      size: 34,
                      onPressed: notifyParent,
                      currentPageIndex: currentPageIndex,
                      thisPageIndex: 1,
                      bottomPadding: 3,
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    NavBarButton(
                      icon: SparkIcons.leaderboard,
                      size: 28,
                      onPressed: notifyParent,
                      currentPageIndex: currentPageIndex,
                      thisPageIndex: 3,
                    ),
                    NavBarButton(
                      icon: SparkIcons.goals,
                      size: 32,
                      onPressed: notifyParent,
                      currentPageIndex: currentPageIndex,
                      thisPageIndex: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (currentPageIndex == 2) ? Colors.blue[300] : Colors.black,
              ),
              child: InkWell(
                customBorder: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: 16,
                    left: 12,
                    right: 12,
                  ),
                  child: Icon(
                    SparkIcons.home,
                    size: 54,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  notifyParent(2);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}