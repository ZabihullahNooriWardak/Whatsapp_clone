import 'package:chat_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: Color(0xFF075E54),
        // scaffoldBackgroundColor: Color(0xFFECE5DD),
        //  appBarTheme: AppBarTheme(
        //     backgroundColor: Color(0xFF075E54),
        //   ),
      ),
      home: HomeScreen(),
    );
  }
}
