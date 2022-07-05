import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:video_stream_spike/main.dart';

class FlickVideoPlayerView extends StatefulWidget {
  const FlickVideoPlayerView({Key? key}) : super(key: key);

  @override
  State<FlickVideoPlayerView> createState() => _FlickVideoPlayerViewState();
}

class _FlickVideoPlayerViewState extends State<FlickVideoPlayerView> {
  late final FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(hlslink),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlickVideoPlayer(
              flickManager: flickManager,
              flickVideoWithControls: const FlickVideoWithControls(),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: Navigator.of(context).pop,
              ),
            )
          ],
        ),
      ),
    );
  }
}
