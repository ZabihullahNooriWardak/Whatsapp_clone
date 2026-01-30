import 'package:camera/camera.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController cameraController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraInitializer();
  }

  Future<void> _cameraInitializer() async {
    try {
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await cameraController.initialize();
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print('Camera access denied !');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return CameraPreview(cameraController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }
}
