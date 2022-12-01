import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: CircularCountDownTimer(
              onComplete: () {
                Navigator.pop(context);
              },
              isReverse: true,
              textStyle: const TextStyle(color: Colors.white),
              width: 100,
              height: 100,
              duration: 10,
              fillColor: Colors.black,
              ringColor: Colors.grey)),
    );
  }
}
