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
    return SizedBox(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _controller.value.isInitialized
              ? buildFullScreen(AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ))
              : Container(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                playButton(),
                Expanded(child: indicator()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector playButton() {
    return GestureDetector(
      onTap: playVideo,
      child: isPlayin ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
    );
  }

  buildFullScreen(AspectRatio aspectRatio) {
    final size = _controller.value.size;
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: aspectRatio,
      ),
    );
  }

  Widget indicator() =>
      VideoProgressIndicator(_controller, allowScrubbing: true);
}
