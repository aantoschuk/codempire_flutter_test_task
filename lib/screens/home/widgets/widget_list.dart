import 'package:flutter/material.dart';

import 'package:codempire_task/screens/home/widgets/slides/slides.dart';

Widget getAction({required int index}) {
  final widgets = [
    PhotoWidget(),
    const VideoWidget(),
    const NotificationWidget(),
  ];

  return widgets[index];
}
