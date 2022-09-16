import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:codempire_task/model/model.dart';

import 'package:codempire_task/screens/view/widgets/widgets.dart';

class ViewPage extends StatelessWidget {
  final File? photo;
  const ViewPage({Key? key, this.photo}) : super(key: key);

  static const routeName = '/view';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));
    final args = ModalRoute.of(context)!.settings.arguments as ViewPageProps;
    return Scaffold(
      body: MainWidget(
        photo: args.photo,
        video: args.video,
      ),
    );
  }
}
