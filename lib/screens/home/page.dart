import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:codempire_task/screens/home/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
