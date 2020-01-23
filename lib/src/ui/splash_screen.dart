import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linked_redesign/src/styles/app_colors.dart';
import 'package:linked_redesign/src/utils/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: AppColors.linkedinBlue,
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.linkedinBlue,
        ),
        child: Center(
            child: Image.asset(
          "assets/images/linkedin_logo.png",
         // color: AppColors.white,
          width: MediaQuery.of(context).size.width / 1.8,
        )),
      ),
    );
  }
}
