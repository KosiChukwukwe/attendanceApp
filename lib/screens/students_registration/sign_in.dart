// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:orginal_atteendance_app/widgets/constant.dart';
import 'package:orginal_atteendance_app/widgets/input_field.dart';
import 'package:orginal_atteendance_app/widgets/rounded_button.dart';

import '../forgetPasswordScreen.dart';
import '../studentmodule/studenthomescreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final numOrAlphaRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');

  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  late String RegNumber;
  late String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        // margin: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              width: size.width * 0.9,
              // height: 40,
              decoration: BoxDecoration(
                color: Colors.red[200],
                // borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                'Invalid Details please try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[700],
                ),
              ),
            ),
            Text(
              'Reg Number:',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: kblack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldContainer(
              ispasswordField: true,
              showPassword: false,
              hintText: 'Please enter your Reg Number',
              prefixIcon: Icon(Icons.format_list_numbered_outlined),
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
              validator: (val) {
                if (val!.isEmpty) {
                  return ' Please enter your Reg Number';
                }
                if (!(val.length == 10)) {
                  return 'Reg Number is invalid, must contain 10 digits';
                } //else if (!val.contains('.')) {
                //return 'Email is invalid, must contain .';
                //}
                return null;
              },
              onChanged: (value) {
                RegNumber = value.trim().toLowerCase();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password:',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: kblack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldContainer(
              ispasswordField: true,
              showPassword: showPassword,
              hintText: 'Please enter your password',
              prefixIcon: Icon(Icons.password),
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              suffixIcon: IconButton(
                icon: showPassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                color: kgrey,
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword ? true : false;
                  });
                },
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please enter a Password';
                }
                if (val.length < 8) {
                  return 'Password must be more than 8 characters';
                }
                // numOrAlphaRegex.hasMatch(val)
                if (!numOrAlphaRegex.hasMatch(val)) {
                  return 'Password must contain alphanumeric characters';
                }
                return null;
              },
              onChanged: (value) {
                password = value.trim().toLowerCase();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot password?'),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen()));
                    },
                    child: Text(
                      ' Reset it Now',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: kblack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RoundedButton(
                color: Color(0xFF188906),
                text: 'Continue',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentHomeScreen()));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
