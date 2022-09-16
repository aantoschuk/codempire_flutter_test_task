import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
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
      } catch (e) {
        log("error push notification");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => sendPushMessage('Yo', 'Codempire'),
        child: const Text('Send Notification'),
      ),
    );
  }
}
