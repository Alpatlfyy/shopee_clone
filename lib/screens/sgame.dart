import 'package:flutter/material.dart';

class SGame extends StatelessWidget {
  const SGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.builder(
        padding: EdgeInsets.zero, // Hilangkan padding
        itemCount: 8,
        itemBuilder: (context, index) {
          // Fullscreen untuk sgame1.png (index == 0)
          if (index == 0) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Image.asset(
                'assets/images/sgame1.png',
                fit: BoxFit.fill,
              ),
            );

          }

          // Sisanya tetap layout biasa
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/sgame${index + 1}.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
