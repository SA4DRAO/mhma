import 'package:flutter/material.dart';

class TextPill extends StatelessWidget {
  const TextPill({super.key, required this.str});
  final String str;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            str,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(Icons.arrow_right_alt)
        ],
      ),
    );
  }
}
