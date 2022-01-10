import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: SizedBox(
                        child: Image.asset('images/Chat_D.png'),
                        height: animation.value * 100,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    // ignore: deprecated_member_use
                    TyperAnimatedTextKit(
                      text: const [
                        "Chat With Dileep",
                      ],
                      textStyle: TextStyle(
                        color: Colors.purple.shade700,
                        fontSize: 25,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  color: Colors.purple.shade400,
                  title: 'Log In',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  color: Colors.purple.shade700,
                  title: "Register",
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
