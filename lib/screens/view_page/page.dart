import 'dart:io';
import 'package:codempire_task/screens/view_page/main_widget.dart';
import 'package:flutter/material.dart';

import 'package:codempire_task/model/model.dart';

class ViewPage extends StatelessWidget {
  final File? photo;
  const ViewPage({Key? key, this.photo}) : super(key: key);

  static const routeName = '/view';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ViewPageProps;
    return Scaffold(
      body: SafeArea(
          child: MainWidget(
        photo: args.photo,
      )),
    );
  }
}
