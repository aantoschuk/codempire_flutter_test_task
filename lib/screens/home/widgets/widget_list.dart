import 'package:flutter/material.dart';

import 'package:codempire_task/screens/home/widgets/photo_widget.dart';
import 'package:codempire_task/screens/home/widgets/video_widget.dart';

Widget getAction({required int index}) {
  final widgets = [
    PhotoWidget(),
    const VideoWidget(),
  ];

  return widgets[index];
}
