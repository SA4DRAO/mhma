// ignore_for_file: dead_code

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mhma/constants/material_black.dart';
import 'package:mhma/provider/google_sign_in.dart';
import 'package:mhma/provider/user_provider.dart';
import 'package:mhma/screens/sign_in_screen.dart';
import 'package:mhma/widgets/chat_analysis_card.dart';
import 'package:mhma/widgets/fitness_card.dart';
import 'package:mhma/widgets/trackmood_card.dart';
import 'package:mhma/widgets/welcome_card.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUploadScreen extends StatefulWidget {
  const ChatUploadScreen({super.key});

  @override
  State<ChatUploadScreen> createState() => _ChatUploadScreenState();
}

class _ChatUploadScreenState extends State<ChatUploadScreen> {
  bool FileIsUploaded = false;
  String analysisResult = "Upload Your Chat";
  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.grey.shade600,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  analysisResult,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 30),
            child: const Text(
              "Upload your chat from WhatsApp!",
              style: TextStyle(color: Colors.white),
            ),
          ),
          InkWell(
            onTap: () async {
              result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowMultiple: false,
                allowedExtensions: ['txt'],
              );

              if (result != null) {
                setState(() {
                  FileIsUploaded = !FileIsUploaded;
                });
                PlatformFile? file = result?.files.first;
                print(file?.name);
                print(file?.bytes);
                print(file?.size);
                print(file?.extension);
                print(file?.path);
                print(result);
                // var request = http.MultipartRequest(
                //     'POST', Uri.parse('http://192.168.137.232:5000/'));

                // request.files.add(await http.MultipartFile.fromPath(
                //     "form_field_name",
                //     "../../assets/WhatsApp_Chat_with_Abhishek_Navadiya_Cse_Nitw.txt"));
                // // request.files.add(await http.MultipartFile.fromPath(
                // //     "form_field_name", file?.path as String));
                // print(file?.path);

                // var response = await request.send();
                // var responsed = await http.Response.fromStream(response);
                // final responseData = json.decode(responsed.body);

                // if (response.statusCode == 200) {
                //   print("SUCCESS");
                //   print(responseData);
                // } else {
                //   print("ERROR");
                // }
                Response response;
                var dio = Dio();
                var formData = FormData.fromMap({
                  'form_field_name':
                      await MultipartFile.fromFile(file?.path as String),
                });
                print((file?.path as String));
                response = await dio.post(
                  'http://192.168.148.155:5000',
                  data: formData,
                  onSendProgress: (int sent, int total) {
                    print('$sent $total');
                  },
                );
                print(response);
                analysisResult = response.toString();
                print(analysisResult);
              }
              setState(() {
                FileIsUploaded = !FileIsUploaded;
                analysisResult = analysisResult;
              });
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
                children: [
                  FileIsUploaded
                      ? Text(
                          "Analysis in progress...",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "Select Chat",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  Icon(Icons.arrow_right_alt)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
