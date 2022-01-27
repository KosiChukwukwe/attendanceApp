
import 'package:flutter/material.dart';
import 'package:orginal_atteendance_app/widgets/constant.dart';

import 'sign_in.dart';
import 'sign_up.dart';

class SignInOrUpScreen extends StatefulWidget {
  const SignInOrUpScreen({Key? key}) : super(key: key);

  @override
  _SignInOrUpScreenState createState() => _SignInOrUpScreenState();
}

class _SignInOrUpScreenState extends State<SignInOrUpScreen> {
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
                              color: isInLoginState ? kblack : kgrey,
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
                              color: isInLoginState ? kblack : kgrey,
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
                              color: isInLoginState ? kgrey : kblack,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Visibility(
                        visible: isInLoginState? false: true  ,
                        child: Container(
                            width: 70,
                            child: Divider(
                              color: isInLoginState ? kgrey : kblack,
                              height: 5,
                              thickness: 1.5,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            isInLoginState ? SignInScreen() : SignUpScreen(),
          ],
        ),
      ),
    ));
  }
}
