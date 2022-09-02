import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

import 'package:codempire_task/screens/view_page/widgets/image_widget.dart';

import 'package:codempire_task/theme/colors.dart';

class ImagePart extends StatelessWidget {
  final File photo;
  final List<Placemark>? currentLocation;
  const ImagePart({Key? key, required this.photo, this.currentLocation})
      : super(key: key);

  void sendPushMessage(String body, String title) async {
    final token = await FirebaseMessaging.instance.getToken();
    Future.delayed(const Duration(seconds: 2), () async {
      try {
        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAADf2SBBw:APA91bHPuDf7ugxHceMotg3FRrIwj6CTUzcWe7JVKGWL70pQWJ7fQSru90S2HEXgxAP5BHWfUtqlXOYRSnnNK6oCGrvYOAJew166uQFOnmZJL6pHh3J9sANqkXKpOfPLH_ZQ7-vryyKm',
          },
          body: jsonEncode(
            <String, dynamic>{
              'notification': <String, dynamic>{
                'body': body,
                'title': title,
              },
              'priority': 'high',
              'data': <String, dynamic>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'id': '1',
                'status': 'done'
              },
              "to": token,
            },
          ),
        );
        print('done');
      } catch (e) {
        print("error push notification");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.dimWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            ImageWidget(photo: photo),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(currentLocation != null
                    ? currentLocation![0].country.toString()
                    : 'No location'),
                Text(currentLocation != null
                    ? currentLocation![0].locality.toString()
                    : 'No location')
              ],
            ),
            GestureDetector(
              onTap: () =>
                  sendPushMessage('From device to device', 'Codempire'),
              child: Text('notification'),
            )
          ],
        ),
      ),
    );
  }
}
