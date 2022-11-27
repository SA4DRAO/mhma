import 'package:flutter/material.dart';
import 'package:mhma/screens/profile_screen.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(left: 20, right: 15, top: 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "how are ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ProfilePage()),
                      ),
                    )
                  },
                  icon: const Icon(Icons.accessibility),
                  color: Colors.white,
                  focusColor: Colors.grey,
                  hoverColor: Colors.grey,
                  highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                )
              ],
            ),
          ),
          const Text(
            "you today?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
