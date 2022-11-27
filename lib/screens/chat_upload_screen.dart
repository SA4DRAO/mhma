import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ChatUploadScreen extends StatelessWidget {
  const ChatUploadScreen({super.key});
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
            child: Container(
              color: Colors.blue,
            ),
          ),
          const Text(
            "Upload your chat from WhatsApp!",
            style: TextStyle(color: Colors.white),
          ),
          InkWell(
            onTap: () async {
              result =
                  await FilePicker.platform.pickFiles(allowMultiple: false);
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
