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
                      onPressed: () async {
                        if (isFlashOn) {
                          await controller.setFlashMode(FlashMode.off);
                        } else {
                          await controller.setFlashMode(FlashMode.torch);
                        }
                        setState(() {
                          isFlashOn = !isFlashOn;
                        });
                      },
                      icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onTakePhoto(context);
                      },
                      onLongPressStart: (d) async {
                        await controller.prepareForVideoRecording();
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
                              borderRadius: BorderRadiusGeometry.circular(50),
                              child: Icon(
                                Icons.fiber_manual_record,
                                size: 60,
                                color: Colors.red,
                              ),
                            )
                          : Icon(Icons.panorama_fish_eye, size: 70),
                    ),

                    IconButton(
                      onPressed: () async {
                        await switchCamera();
                        setState(() {
                          if (transformAngle == 0.0) {
                            transformAngle = 180;
                          } else {
                            transformAngle = 0.0;
                          }
                        });
                      },
                      icon: Transform.rotate(
                        angle: transformAngle,
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

  Future<void> switchCamera() async {
    if (cameras.length < 2) return;
    CameraLensDirection newDirection =
        controller.description.lensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;
    final newCamera = cameras.firstWhere((element) {
      return element.lensDirection == newDirection;
    });

    await controller.dispose();
    controller = CameraController(newCamera, ResolutionPreset.max);
    await controller.initialize();
    if (!mounted) return;
    setState(() {});
  }
}
