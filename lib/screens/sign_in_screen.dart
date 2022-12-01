import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mhma/main.dart';
import 'package:mhma/provider/google_sign_in.dart';
import 'package:mhma/provider/user_provider.dart';
import 'package:provider/provider.dart';
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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            context.read<UserProvider>().setUser(snapshot.data);
            snapshot.data!;
            return HomePage(
              user: snapshot.data!,
            );
          } else {
            return const SignUpScreen();
          }
        },
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            child: const Text("Sign In With Google!"),
          )
        ],
      ),
    );
  }
}
