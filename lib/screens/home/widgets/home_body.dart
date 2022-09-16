import 'package:flutter/material.dart';

import 'package:codempire_task/services/vibration.dart';

import 'package:codempire_task/theme/colors.dart';

import './widget_list.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  int currentIndex = 0;
  Color currentColor = CustomColors.cadetBlue;

  void detectSwipe(details) {
    int sensitivity = 8;
    if (details.velocity.pixelsPerSecond.dx < -sensitivity) {
      vibrate();
      if (currentIndex == 2) return;
      setState(() {
        currentIndex = currentIndex + 1;
      });
    } else if (details.velocity.pixelsPerSecond.dx > sensitivity) {
      vibrate();
      if (currentIndex == 0) return;
      setState(() {
        currentIndex = currentIndex - 1;
      });
    }
    switch (currentIndex) {
      case 0:
        {
          setState(() {
            currentColor = CustomColors.cadetBlue;
          });
        }
        break;
      case 1:
        {
          setState(() {
            currentColor = Colors.white;
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: currentIndex != 2
            ? BoxDecoration(color: currentColor)
            : BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CustomColors.crimson,
                      CustomColors.redMunsell,
                    ],
                    stops: const [
                      0.4,
                      0.5,
                    ]),
              ),
        child: GestureDetector(
          onHorizontalDragEnd: (details) => detectSwipe(details),
          child: Center(
            child: getAction(index: currentIndex),
          ),
        ),
      ),
    );
  }
}
