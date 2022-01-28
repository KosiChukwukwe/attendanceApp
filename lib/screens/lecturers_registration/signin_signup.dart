// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:orginal_atteendance_app/widgets/constant.dart';

import 'signinscreen.dart';
import 'signupscreen.dart';

class SignInOrSignUpScreen extends StatefulWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);

  @override
  _SignInOrSignUpScreenState createState() => _SignInOrSignUpScreenState();
}

class _SignInOrSignUpScreenState extends State<SignInOrSignUpScreen> {
  late bool isInLoginState, isNotInLoginState;
  @override
  void initState() {
    isInLoginState = true;
    // isNotInLoginState  = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isInLoginState = true;
                          });
                        },
                        child: Container(
                          width: 80,
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: isInLoginState ? Color(0xFF188906) : kgrey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: isInLoginState,
                        child: Container(
                            width: 70,
                            child: Divider(
                              color: isInLoginState ? Color(0xFF188906) : kgrey,
                              height: 5,
                              thickness: 1.5,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isInLoginState = false;
                          });
                        },
                        child: Container(
                          width: 80,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: isInLoginState ? kgrey : Color(0xFF188906),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: isInLoginState ? false : true,
                        child: Container(
                            width: 70,
                            child: Divider(
                              color: isInLoginState ? kgrey : Color(0xFF188906),
                              height: 5,
                              thickness: 1.5,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            isInLoginState ? LoginInScreen() : RegisterScreen(),
          ],
        ),
      ),
    ));
  }
}
