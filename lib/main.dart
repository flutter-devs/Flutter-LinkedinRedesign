import 'package:flutter/material.dart';
import 'package:linked_redesign/app_colors.dart';
import 'package:linked_redesign/router.dart';
import 'package:linked_redesign/splash_screen.dart';

void main() => runApp(LinkedinApp());

class LinkedinApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primarySwatch: AppColors.white,
      ),
      home: SplashScreen(),
    );
  }
}

