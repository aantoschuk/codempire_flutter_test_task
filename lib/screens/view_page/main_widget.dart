import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:codempire_task/screens/view_page/widgets/widgets.dart';

class MainWidget extends StatefulWidget {
  final File? photo;
  final File? video;
  static const routeName = '/view';

  const MainWidget({Key? key, required this.photo, this.video})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  List<Placemark>? currentLocation;
  String? fcmToken;
  void getFCMToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    setState(() {
      fcmToken = token;
    });
  }

  @override
  void initState() {
    super.initState();
    getFCMToken();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.photo != null) {
      return ImagePart(photo: widget.photo!);
    } else if (widget.video != null) {
      return VideoPart(video: widget.video!);
    }
    return const Text('nothing');
  }
}
