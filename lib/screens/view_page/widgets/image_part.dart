import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:codempire_task/screens/view_page/widgets/image_widget.dart';

import 'package:codempire_task/theme/colors.dart';

class ImagePart extends StatelessWidget {
  final File photo;
  final List<Placemark>? currentLocation;
  const ImagePart({Key? key, required this.photo, this.currentLocation})
      : super(key: key);

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
            ImageWidget(photo: photo!),
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
            )
          ],
        ),
      ),
    );
  }
}
