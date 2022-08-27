import 'package:codempire_task/services/vibration.dart';
import 'package:flutter/material.dart';

import 'package:codempire_task/screens/home/widgets/widgets.dart';

import 'package:codempire_task/theme/colors.dart';

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
      if (currentIndex == 0) {
        setState(() {
          currentColor = Colors.white;
          currentIndex = 1;
        });
      }
    } else if (details.velocity.pixelsPerSecond.dx > sensitivity) {
      vibrate();
      if (currentIndex == 1) {
        setState(() {
          currentColor = CustomColors.cadetBlue;
          currentIndex = 0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: currentColor),
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
