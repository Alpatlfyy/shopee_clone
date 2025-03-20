import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'constants.dart';

void main() {
  runApp(const ShopeeLikeApp());
}

class ShopeeLikeApp extends StatelessWidget {
  const ShopeeLikeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopee-like Dashboard',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFFECECEC), // Warna latar belakang utama
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
        ),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
