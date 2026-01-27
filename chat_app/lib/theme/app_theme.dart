import 'package:flutter/material.dart';

ColorScheme get _colorScheme{
  return ColorScheme.fromSeed(seedColor: Color(0xFF075E54),
  // secondary:
  );
}

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'OpenSans',
    primaryColor: Color(0xFF075E54),
    appBarTheme: AppBarTheme(
      backgroundColor: _colorScheme.primary,
      foregroundColor: _colorScheme.onPrimary,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:_colorScheme.primary ,foregroundColor: Colors.white)
  );
  
}
