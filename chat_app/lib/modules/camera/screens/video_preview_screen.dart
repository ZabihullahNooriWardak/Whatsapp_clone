import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  const VideoPreviewScreen({super.key, required this.path});
  final String path;

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  _initializeVideoPlayer() async {
    _controller = VideoPlayerController.file(File(widget.path));
    await _controller.initialize();
    //just for updating view to be aware of the controller initialization
    setState(() {});

    _controller.addListener(() {
      if (!_controller.value.isInitialized) return;

      final duration = _controller.value.duration;
      final position = _controller.value.position;
      if (position >= duration) {
        _controller.seekTo(Duration.zero);
        _controller.pause();
        setState(() {});
      }
    });
  }

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
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
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
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (_controller.value.isPlaying) {
                    setState(() {
                      _controller.pause();
                    });
                  } else {
                    setState(() {
                      _controller.play();
                    });
                  }
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 30,
                  child: _controller.value.isPlaying
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
