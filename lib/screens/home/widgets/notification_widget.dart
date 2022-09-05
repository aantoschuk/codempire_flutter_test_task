import 'package:flutter/material.dart';

import 'package:codempire_task/theme/colors.dart';
import 'package:codempire_task/services/routes.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  void navigateToNotification(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.notification,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => navigateToNotification(context),
          child: Image.asset(
            'assets/images/notification.jpg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 10),
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: CustomColors.burgundy,
                ),
              ),
              Text(
                'Нотифікація & геолокація',
                style: TextStyle(
                    color: CustomColors.burgundy,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
