import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live')),
      body: const Center(child: Text('Ini adalah halaman Live')),
    );
  }
}