import 'package:flutter/material.dart';

// Halaman Profil
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: const Center(child: Text('Ini adalah halaman Profil')),
    );
  }
}
