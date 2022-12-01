import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mhma/constants/material_black.dart';
import 'package:mhma/provider/google_sign_in.dart';
import 'package:mhma/screens/sign_in_screen.dart';
import 'package:mhma/widgets/chat_analysis_card.dart';
import 'package:mhma/widgets/chat_with_doctor_card.dart';
import 'package:mhma/widgets/fitness_card.dart';
import 'package:mhma/widgets/mood_tracking_card.dart';
import 'package:mhma/widgets/trackmood_card.dart';
import 'package:mhma/widgets/welcome_card.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => GoogleSignInProvider(),
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => GoogleSignInProvider()),
        ),
      ],
      child: MaterialApp(
        title: 'MHMA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: primaryBlack,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 160,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: WelcomeCard(),
                    centerTitle: true,
                  ),
                ),
              ];
            },
            body: ListView(
              children: [
                const MoodTrackCard(),
                const ChatUploadCard(),
                const FitnessCard(),
                Track_Mood_Card(email: user.email!, uid: user.uid),
                ChatWithDoctor(email: user.email!, uid: user.uid),
                ElevatedButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                    },
                    child: const Text("Log Out!"))
              ],
            )),
      ),
    );
  }
}
