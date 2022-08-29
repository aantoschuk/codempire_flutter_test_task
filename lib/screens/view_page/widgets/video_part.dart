import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPart extends StatefulWidget {
  final File video;
  const VideoPart({Key? key, required this.video}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoPartState();
}

class VideoPartState extends State<VideoPart> {
  late VideoPlayerController _controller;
  bool isPlayin = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.video)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void playVideo() {
    if (isPlayin) {
      _controller.pause();
      setState(() {
        isPlayin = false;
      });
    } else {
      _controller.play();
      setState(() {
        isPlayin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        GestureDetector(
          onTap: playVideo,
          child:
              isPlayin ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}
