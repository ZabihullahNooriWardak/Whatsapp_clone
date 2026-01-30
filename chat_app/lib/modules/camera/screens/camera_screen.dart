import 'package:camera/camera.dart';
import 'package:chat_app/main.dart' show cameras;
import 'package:chat_app/modules/camera/screens/camera_photo_preview_screen.dart';
import 'package:chat_app/utils/camera/screens/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraInitializer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      print('Camera access denied !');
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.flash_off)),
                    IconButton(
                      onPressed: () {
                        _onTakePhoto(context);
                      },
                      icon: Icon(Icons.panorama_fish_eye, size: 70),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.flip_camera_ios),
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

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CameraPhotoPreveiw(path: file.path);
        },
      ),
    );
  }
}
