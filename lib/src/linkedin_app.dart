import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linked_redesign/src/styles/app_colors.dart';
import 'package:linked_redesign/src/ui/splash_screen.dart';
import 'package:linked_redesign/src/utils/router.dart';


class LinkedinApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LinkedinAppState createState() => _LinkedinAppState();
}

class _LinkedinAppState extends State<LinkedinApp> {
  @override
  void initState() {
    setAppBar();
    super.initState();

  }

  setAppBar(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness:
        Brightness.light //or set color with: Color(0xFF0000FF)
    ));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primarySwatch: AppColors.white,
          appBarTheme: AppBarTheme(
            textTheme:
                TextTheme(title: TextStyle(color: AppColors.linkedinBlue)),
          ),
          iconTheme: IconThemeData(color: AppColors.linkedinBlue)),
      home: SplashScreen(),
    );
  }
}

