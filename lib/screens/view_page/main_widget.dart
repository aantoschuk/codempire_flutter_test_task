import 'dart:io';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  final File? photo;
  const MainWidget({Key? key, this.photo}) : super(key: key);

  static const routeName = '/view';

  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return const Text('photo');
    } else {
      return const Text('No Photo');
    }
  }
}
