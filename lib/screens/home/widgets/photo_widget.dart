import 'dart:developer';
import 'dart:io';

import 'package:codempire_task/model/model.dart';
import 'package:codempire_task/services/routes.dart';
import 'package:flutter/material.dart';

import 'package:codempire_task/theme/colors.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PhotoWidget extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  PhotoWidget({
    Key? key,
  }) : super(key: key);

  void getImage(BuildContext context) {
    _picker.pickImage(source: ImageSource.camera).then((value) {
      if (value == null) return;
      final image = File(value.path);
      // use build context synchronously
      Navigator.pushNamed(context, Routes.view,
          arguments: ViewPageProps(photo: image));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => getImage(context),
          child: Image.asset(
            'assets/images/photo.png',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Зробити фото',
              style: TextStyle(
                  color: CustomColors.mignightGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: CustomColors.mignightGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
