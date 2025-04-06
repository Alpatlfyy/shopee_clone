import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // List video dari assets
  final List<String> videoPaths = [
    "assets/videos/video_1.mp4",
    "assets/videos/video_2.mp4",
    "assets/videos/video_3.mp4",
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Center(child: VideoPlayerWidget(videoPath: videoPaths[index])),
              Positioned(
                right: 10,
                bottom: 100,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    IconButton(
                      icon: Icon(Icons.bookmark, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white, size: 35),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/avatar.png"),
                      radius: 20,
                    ),
                    SizedBox(width: 10),
                    Text("Username", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });
      },
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
