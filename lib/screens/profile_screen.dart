import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
    required this.email,
    required this.uid,
    this.displayName,
    this.photoUrl,
  });
  String? displayName = "";
  String uid = "";
  String email = "";
  String? photoUrl = "";
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/profile.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.displayName!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                  ],
                ),
              ),
              Text(
                widget.email,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'My Profile',
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                    ),
                    OutlinedButton(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Log Out!",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
