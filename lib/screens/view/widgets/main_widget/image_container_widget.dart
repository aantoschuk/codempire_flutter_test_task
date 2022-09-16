import 'dart:io';
import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  final File photo;
  const ImageContainerWidget({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              photo,
            ),
          ),
        ),
      ],
    );
  }
}
