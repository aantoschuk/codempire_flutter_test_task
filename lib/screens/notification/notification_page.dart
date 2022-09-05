import 'package:flutter/material.dart';

import 'package:codempire_task/screens/notification/geolocation_widget.dart';
import 'package:codempire_task/screens/notification/notification_sender.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(child: NotificationSender()),
            Padding(
              padding: EdgeInsets.only(bottom: 20, left: 10),
              child: GeolocationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
