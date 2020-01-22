import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linked_redesign/src/ui/home_screen.dart';
import 'package:linked_redesign/src/ui/splash_screen.dart';

const String routeInitial = "splash";
const String homePage = "homePage";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeInitial:
        return materialRoute(SplashScreen());
        break;
      case homePage:
        return materialRoute(HomeScreen());
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
