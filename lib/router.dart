import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_redesign/splash_screen.dart';

const String routeInitial = "splash";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeInitial:
        materialRoute(SplashScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static MaterialPageRoute materialRoute(screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}
