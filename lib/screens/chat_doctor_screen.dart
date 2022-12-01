import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mhma/constants/material_black.dart';
import 'package:mhma/provider/google_sign_in.dart';
import 'package:mhma/screens/sign_in_screen.dart';
import 'package:mhma/widgets/chat_analysis_card.dart';
import 'package:mhma/widgets/fitness_card.dart';
import 'package:mhma/widgets/trackmood_card.dart';
import 'package:mhma/widgets/welcome_card.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final message = <String, dynamic>{
  "creatdate": DateTime.now(),
  "message": "This is a test",
  "uid": "another_test",
};

class ChatScreen extends StatefulWidget {
  ChatScreen({
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
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              db.collection("chats").add(message).then(
                  (DocumentReference doc) => print("Pushed to Firestore"));
            },
            child: Text('${widget.email}'),
          )
        ],
      ),
    );
  }
}
