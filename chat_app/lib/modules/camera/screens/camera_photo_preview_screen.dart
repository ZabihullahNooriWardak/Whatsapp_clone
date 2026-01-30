import 'dart:io';

import 'package:flutter/material.dart';

class CameraPhotoPreveiw extends StatelessWidget {
  const CameraPhotoPreveiw({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop_rotate)),
          IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions)),
          IconButton(onPressed: () {}, icon: Icon(Icons.text_fields)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            decoration: BoxDecoration(),
            child: Image.file(File(path), fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
