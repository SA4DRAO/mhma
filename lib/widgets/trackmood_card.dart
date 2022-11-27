import 'package:flutter/material.dart';
import 'package:mhma/screens/meditation_screen.dart';
import 'package:mhma/widgets/monochrome_pill_box.dart';

class MoodTrackCard extends StatelessWidget {
  const MoodTrackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 30,
      ),
      color: const Color.fromARGB(255, 24, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: const Text(
              "Discover our relaxing exercises",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
          ),
          Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeditationScreen(),
                      ),
                    );
                  },
                  child: TextPill(str: "Start Meditation"))),
        ],
      ),
    );
  }
}
