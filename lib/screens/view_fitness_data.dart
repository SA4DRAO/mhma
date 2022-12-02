import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health/health.dart';
import 'package:mhma/constants/material_black.dart';
import 'package:mhma/provider/google_sign_in.dart';
import 'package:mhma/screens/sign_in_screen.dart';
import 'package:mhma/widgets/chat_analysis_card.dart';
import 'package:mhma/widgets/monochrome_pill_box.dart';
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
  List<dynamic>? data;
  List<int> fitness_data = [];
  var heart_rate;
  var step_count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(builder: ((context, snapshot) {
              if (fitness_data == null) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: fitness_data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        textColor: Colors.black,
                        tileColor: Colors.grey,
                        title: Text(fitness_data[index].toString()),
                      );
                    });
              }
            })),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () async {
                  var status = await Permission.activityRecognition.request();
                  bool requested = await health.requestAuthorization(types);
                  if (status.isGranted) {
                    var midnight = DateTime(now.year, now.month, now.day);
                    steps = await health.getTotalStepsInInterval(midnight, now);
                    data = await health.getHealthDataFromTypes(
                        midnight, now, types);
                    heart_rate = data![0];
                    step_count = data![1];
                    fitness_data.add(steps!);
                    print(step_count);
                  } else {
                    Fluttertoast.showToast(
                        msg: "User did not provide sufficient permissions!");
                  }
                },
                child: TextPill(str: "Get Fitness Data")),
          )
        ],
      ),
    );
  }
}
