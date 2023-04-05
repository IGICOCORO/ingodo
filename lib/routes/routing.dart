import 'package:flutter/material.dart';
import 'package:ingodo_manager/routes/routes.dart';
import 'package:ingodo_manager/screens/homescreen.dart';
import 'package:ingodo_manager/screens/login_screen.dart';

import '../screens/not_found.dart';
import '../screens/splashscreen.dart';

class Routing {
  static Route<dynamic> routing(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const NotFound(),
    );
  }
}
