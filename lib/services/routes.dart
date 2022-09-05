import 'package:flutter/material.dart';

import 'package:codempire_task/screens/screens.dart';
import 'package:codempire_task/screens/notification/notification.dart';

// All routes
class Routes {
  static const String initial = '/';
  static const String view = ViewPage.routeName;
  static const String notification = NotificationPage.route;

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const Home(),
      ViewPage.routeName: (context) => const ViewPage(),
      NotificationPage.route: (context) => const NotificationPage()
    };
  }
}
