import 'package:chat_app/cores/home_view.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: appTheme(), home: HomeScreen());
  }
}
