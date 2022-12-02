import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mood {
  Mood({
    this.mood,
    this.uid,
  });
  final int? mood;
  final String? uid;
  final CollectionReference db = FirebaseFirestore.instance.collection("moods");
}
