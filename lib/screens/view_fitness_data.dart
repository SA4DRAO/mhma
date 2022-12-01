import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health/health.dart';
import 'package:mhma/constants/material_black.dart';
import 'package:mhma/provider/google_sign_in.dart';
import 'package:mhma/screens/sign_in_screen.dart';
import 'package:mhma/widgets/chat_analysis_card.dart';
import 'package:mhma/widgets/trackmood_card.dart';
import 'package:mhma/widgets/welcome_card.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';

class FitnessDataScreen extends StatefulWidget {
  const FitnessDataScreen({super.key});

  @override
  State<FitnessDataScreen> createState() => _FitnessDataScreenState();
}

class _FitnessDataScreenState extends State<FitnessDataScreen> {
  HealthFactory health = HealthFactory();
  var types = [
    HealthDataType.HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.SLEEP_ASLEEP,
  ];
  var now = DateTime.now();
  int? steps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                var status = await Permission.activityRecognition.request();

                bool requested = await health.requestAuthorization(types);
                if (status.isGranted) {
                  var midnight = DateTime(now.year, now.month, now.day);
                  steps = await health.getTotalStepsInInterval(midnight, now);
                  print(steps);
                } else {
                  Fluttertoast.showToast(
                      msg: "User did not provide sufficient permissions!");

                  if (await Permission
                      .activityRecognition.isPermanentlyDenied) {
                    openAppSettings();
                  }
                }
              },
              child: Text("Get Fitness Data!"))
        ],
      ),
    );
  }
}
