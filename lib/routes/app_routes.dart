

import 'package:flutter/material.dart';
import 'package:getx_example/screens/HomeScreen.dart';
import 'package:getx_example/screens/TodoScreen.dart';
import 'package:getx_example/screens/TrainingHomeScreen.dart';
import 'package:getx_example/screens/shopping_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String todo = '/todo';
  static const String cart = '/cart';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(TrainigHomeScreen(), settings);//_buildRoute(HomeScreen(), settings);
      
      case todo:
        return _buildRoute(TodoScreen(), settings);

      case cart:
        return _buildRoute(ShoppingPage(), settings);

      default:
        return _buildRoute(Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }

}
