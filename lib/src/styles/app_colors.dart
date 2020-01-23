import 'package:flutter/material.dart';

class AppColors {
  static const int _white = 0xffffffff;
 static const MaterialColor white = MaterialColor(
    _white,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_white),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const Color linkedinBlue = Color(0xff0073B0);
  static const Color linkedinLightGray = Color(0xffE0EAF0);
  static const Color linkedinDarkGray =  Color(0xffC4C4C4);
  static const Color linkedinBlack =  Color(0xff000000);
}
