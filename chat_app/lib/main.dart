import 'package:camera/camera.dart';
import 'package:chat_app/cores/home_view.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
