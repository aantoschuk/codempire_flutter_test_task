import 'dart:io';

import 'package:codempire_task/model/model.dart';
import 'package:codempire_task/services/routes.dart';
import 'package:flutter/material.dart';

import 'package:codempire_task/theme/colors.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animController;

  final ImagePicker _picker = ImagePicker();

  @override
  initState() {
    super.initState();

    _animController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void pickVideo() {
    _picker.pickVideo(source: ImageSource.camera).then((value) {
      Navigator.pushNamed(context, Routes.view,
          arguments: ViewPageProps(video: File(value!.path)));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
    return FadeTransition(
      opacity: _animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: pickVideo,
            child: Image.asset(
              'assets/images/video.png',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, right: 10),
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: CustomColors.illuminatingEmerald,
                ),
              ),
              Text(
                'Зробити фото',
                style: TextStyle(
                    color: CustomColors.illuminatingEmerald,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
