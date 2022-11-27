import 'package:flutter/material.dart';
import 'package:mhma/constants/MaterialBlack.dart';
import 'package:mhma/widgets/chat_analysis_card.dart';
import 'package:mhma/widgets/chip_widgets.dart';
import 'package:mhma/widgets/monochrome_pill_box.dart';
import 'package:mhma/widgets/trackmood_card.dart';
import 'package:mhma/widgets/welcome_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MHMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: primaryBlack,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                const SliverAppBar(
                  expandedHeight: 160,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: WelcomeCard(),
                    centerTitle: true,
                  ),
                ),
              ];
            },
            body: ListView(
              children: const [
                MoodTrackCard(),
                ChatUploadCard(),
              ],
            )),
      ),
    );
  }
}
