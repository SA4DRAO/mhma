import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.clr,
    required this.txt,
    required this.ico,
  });

  final Color clr;
  final String txt;
  final IconData ico;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      elevation: 8.0,
      padding: const EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(
          ico,
          color: clr,
          size: 20,
        ),
      ),
      label: Text(txt),
      onPressed: () {},
      backgroundColor: Colors.grey[200],
      shape: StadiumBorder(
          side: BorderSide(
        width: 1,
        color: clr,
      )),
    );
    ;
  }
}
