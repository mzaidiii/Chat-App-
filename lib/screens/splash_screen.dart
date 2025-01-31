import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset('assets/chat2.png'),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Lodding ... ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black12),
          ),
        ],
      )),
    );
  }
}
