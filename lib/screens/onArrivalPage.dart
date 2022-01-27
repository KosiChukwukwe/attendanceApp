// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orginal_atteendance_app/screens/lecturerSignup.dart';

import 'students_registration/sign_in_or_sign_up_screen.dart';

// ignore: use_key_in_widget_constructors
class onArrivalPage extends StatefulWidget {
  @override
  _onArrivalPageState createState() => _onArrivalPageState();
}

class _onArrivalPageState extends State<onArrivalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF188906),
          title: Center(
            child: Text("ATTENDANCE APP"),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin:
                const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 20),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    "assets/images/nacos_logo.png",
                    height: 55,
                    width: 55,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/nau_logo.png",
                    height: 55,
                    width: 55,
                    fit: BoxFit.contain,
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "LOGIN // SIGN-UP as...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFF188906)),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/students.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 7,
                ),
                TextButton(
                    child: Text('STUDENT'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF188906),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInOrUpScreen()),
                      );
                    }),
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/lecturer.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 7,
                ),
                TextButton(
                    child: Text('LECTURER'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF188906),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const lecturerSignup()),
                      );
                    }),
              ],
            )));
  }
}
