import 'package:chat_app/utils/camera/screens/camera_view.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Positioned.fill(child: CameraView()),
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
                        onPressed: () {},
                        icon: Icon(Icons.panorama_fish_eye,size: 70,),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.flip_camera_ios),
                      ),
                    ],
                  ),
                  SafeArea(child: Text('Hold for video, tap for photo',style: TextStyle(color: Colors.white,fontSize: 16),))
                ],
              ),
              
            ),
          ),
        ],
    
    );
  }
}
