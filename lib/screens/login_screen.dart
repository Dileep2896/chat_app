import 'package:chat_app/components/loading.dart';
import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return showSpinner
        ? const Loading()
        : Stack(
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
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: SizedBox(
                            height: 200.0,
                            child: Image.asset(
                              "images/Chat_D.png",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter your email",
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter your password",
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        onPressed: () async {
                          if (email != null && password != null) {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final getUser =
                                  await _auth.signInWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                              Navigator.pushNamed(context, ChatScreen.id);
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              // ignore: avoid_print
                              print(e.toString());
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          }
                        },
                        color: Colors.purple.shade400,
                        title: "Log In",
                      )
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
