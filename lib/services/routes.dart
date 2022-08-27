import 'package:flutter/material.dart';

import 'package:codempire_task/screens/screens.dart';

// All routes
class Routes {
  static const String initial = '/';
  static const String view = ViewPage.routeName;

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const Home(),
      ViewPage.routeName: (context) => const ViewPage()
    };
  }
}
