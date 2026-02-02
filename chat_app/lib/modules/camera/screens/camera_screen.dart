import 'dart:math';

import 'package:camera/camera.dart';
import 'package:chat_app/main.dart' show cameras;
import 'package:chat_app/modules/camera/screens/camera_photo_preview_screen.dart';
import 'package:chat_app/modules/camera/screens/video_preview_screen.dart';
import 'package:chat_app/utils/camera/screens/camera_view.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  bool isRecording = false;
  bool isFlashOn = false;
  double transformAngle = 0.0;
  @override
  void initState() {
    super.initState();
    _cameraInitializer();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future<void> _cameraInitializer() async {
    try {
      controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      // print('Camera access denied !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: CameraView(cameraController: controller)),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (isFlashOn) {
                          controller.setFlashMode(FlashMode.torch);
                        } else {
                          controller.setFlashMode(FlashMode.off);
                        }
                        setState(() {
                          isFlashOn = !isFlashOn;
                        });
                      },
                      icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onTakePhoto(context);
                      },
                      onLongPressStart: (d) async {
                        await controller.startVideoRecording();
                        setState(() {
                          isRecording = true;
                        });
                      },
                      onLongPressEnd: (d) async {
                        final file = await controller.stopVideoRecording();
                        setState(() {
                          isRecording = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return VideoPreviewScreen(path: file.path);
                            },
                          ),
                        );
                      },
                      child: isRecording
                          ? ClipRRect(
                              child: Icon(
                                Icons.fiber_manual_record,
                                size: 60,
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadiusGeometry.circular(50),
                            )
                          : Icon(Icons.panorama_fish_eye, size: 70),
                    ),

                    IconButton(
                      onPressed: () {
                        
                        setState(() {
                          transformAngle += pi;
                        });
                      },
                      icon: Transform(
                        transform: Matrix4.rotationY(transformAngle),
                        child: Icon(Icons.flip_camera_ios),
                      ),
                    ),
                  ],
                ),
                SafeArea(
                  child: Text(
                    'Hold for video, tap for photo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _onTakePhoto(BuildContext context) async {
    // final path = await getTemporaryDirectory();
    // var savingPath = join(path.path, '${DateTime.now()}.png');
    final file = await controller.takePicture();
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CameraPhotoPreveiw(path: file.path);
        },
      ),
    );
  }
}
