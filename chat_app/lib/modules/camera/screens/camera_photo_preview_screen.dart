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
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(),
              child: Image.file(File(path), fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
                width: MediaQuery.of(context).size.width,

                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'type a caption... ',

                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.done),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
