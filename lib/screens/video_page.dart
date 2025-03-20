import 'package:flutter/material.dart';
class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video')),
      body: const Center(child: Text('Ini adalah halaman Video')),
    );
  }
}

