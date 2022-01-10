import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DesicionTree extends StatefulWidget {
  static String id = 'desicion_tree';

  const DesicionTree({Key? key}) : super(key: key);
  @override
  _DesicionTreeState createState() => _DesicionTreeState();
}

class _DesicionTreeState extends State<DesicionTree> {
  User? user;

  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return const WelcomeScreen();
    }
    return const ChatScreen();
  }
}
