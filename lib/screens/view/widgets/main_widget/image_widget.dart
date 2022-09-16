import 'dart:io';
import 'package:flutter/material.dart';

import 'package:codempire_task/screens/view/widgets/main_widget/image_container_widget.dart';

import 'package:codempire_task/theme/colors.dart';

class ImageWidget extends StatelessWidget {
  final File photo;
  const ImageWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

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
            ImageContainerWidget(photo: photo),
          ],
        ),
      ),
    );
  }
}
