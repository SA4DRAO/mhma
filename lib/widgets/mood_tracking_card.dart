import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mhma/screens/meditation_screen.dart';
import 'package:mhma/screens/mood_tracking_screen.dart';
import 'package:mhma/widgets/monochrome_pill_box.dart';

class Track_Mood_Card extends StatefulWidget {
  Track_Mood_Card({
    super.key,
    required this.email,
    required this.uid,
    this.displayName,
    this.photoUrl,
  });
  String? displayName = "";
  String uid = "";
  String email = "";
  String? photoUrl = "";
  @override
  State<Track_Mood_Card> createState() => _Track_Mood_CardState();
}

class _Track_Mood_CardState extends State<Track_Mood_Card> {
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
            // padding:
            // EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: SvgPicture.asset(
              'assets/relaxing.svg',
              width: 400,
              height: 400,
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: const Text(
              "Track Mood",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoodTrackScreen(
                      email: widget.email,
                      uid: widget.uid,
                    ),
                  ),
                );
              },
              child: const TextPill(str: "Today's Mood"),
            ),
          ),
        ],
      ),
    );
  }
}
