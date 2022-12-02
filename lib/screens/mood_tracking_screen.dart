import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MoodTrackScreen extends StatefulWidget {
  MoodTrackScreen({
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
  State<MoodTrackScreen> createState() => _MoodTrackScreenState();
}

class _MoodTrackScreenState extends State<MoodTrackScreen> {
  var db = FirebaseFirestore.instance;
  final CollectionReference docdb =
      FirebaseFirestore.instance.collection('moods');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
              height: 300,
              child: StreamBuilder(
                stream: docdb.orderBy('createDate').snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    if (streamSnapshot.data!.size <= 7) {
                      return ListView.builder(
                          itemCount: streamSnapshot.data!.size,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];

                            return Card(
                              child: ListTile(
                                title:
                                    Text(documentSnapshot['mood'].toString()),
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return Card(
                              child: ListTile(
                                title:
                                    Text(documentSnapshot['mood'].toString()),
                              ),
                            );
                          });
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
          InkWell(
            onTap: () {
              docdb.add(<String, dynamic>{
                "mood": 1,
                "uid": widget.email,
                "createDate": DateTime.now().microsecondsSinceEpoch,
              }).then((DocumentReference doc) => print("Pushed to Firestore"));
            },
            child: Container(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Happy",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              docdb.add(<String, dynamic>{
                "mood": 2,
                "uid": widget.email,
                "createDate": DateTime.now().microsecondsSinceEpoch,
              }).then((DocumentReference doc) => print("Pushed to Firestore"));
            },
            child: Container(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Neutral",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              docdb.add(<String, dynamic>{
                "mood": 3,
                "uid": widget.email,
                "createDate": DateTime.now().microsecondsSinceEpoch,
              }).then((DocumentReference doc) => print("Pushed to Firestore"));
            },
            child: Container(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Sad",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
