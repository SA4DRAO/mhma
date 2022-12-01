import 'package:flutter/material.dart';
import 'package:mhma/screens/chat_doctor_screen.dart';
import 'package:mhma/screens/chat_upload_screen.dart';
import 'package:mhma/widgets/monochrome_pill_box.dart';

class ChatWithDoctor extends StatelessWidget {
  ChatWithDoctor({
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: const Text(
              "Talk to Your Doctor!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(email: email, uid: uid),
                      ),
                    );
                  },
                  child: const TextPill(str: "Talk To Doctor"))),
        ],
      ),
    );
  }
}
