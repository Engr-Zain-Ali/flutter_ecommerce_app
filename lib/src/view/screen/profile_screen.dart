import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('assets/images/profile_pic.png')),
          const Text(
            "Hello Zain Ali!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

        ],
      ),
    );
  }
}
