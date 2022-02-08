// ignore_for_file: file_names

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Myvideo extends StatefulWidget {
  const Myvideo({Key? key, required this.asset}) : super(key: key);

  @override
  _MyvideoState createState() => _MyvideoState();
  final String asset;
}

class _MyvideoState extends State<Myvideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)
      ..setLooping(true)..play()
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: CircularProgressIndicator()),
          onTap: () {
            _controller.value.isPlaying?_controller.pause():_controller.play();
          },
        );
  }
}

