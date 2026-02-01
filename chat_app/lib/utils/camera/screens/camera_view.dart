import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.cameraController});
  final CameraController cameraController;
  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    CameraController controller = widget.cameraController;

    if (!controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return CameraPreview(controller);
  }


}
