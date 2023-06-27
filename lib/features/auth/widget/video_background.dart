import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoSplashView extends StatefulWidget {
  const VideoSplashView({super.key});

  @override
  State<VideoSplashView> createState() => _VideoSplashViewState();
}

class _VideoSplashViewState extends State<VideoSplashView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/etc/auth_video_ios.mp4");
    _controller
      ..addListener(() {
        if (_controller.value.hasError) {
          debugPrint("error");
        }
      })
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          debugPrint("load video Done");
        });
      })
      ..play();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: 1.sw / 1.sh,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
