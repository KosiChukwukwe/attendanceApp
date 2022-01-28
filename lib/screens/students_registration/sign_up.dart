// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:orginal_atteendance_app/widgets/constant.dart';
import 'package:orginal_atteendance_app/widgets/input_field.dart';
import 'package:orginal_atteendance_app/widgets/rounded_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  late String name;
  late String email;
  late String password;
  late String confirmPassword;
  bool notMatched = false;

  final numOrAlphaRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
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
            'Name:',
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
            hintText: 'Please enter your name ',
            prefixIcon: Icon(Icons.person),
            inputType: TextInputType.name,
            inputAction: TextInputAction.next,
            validator: (val) => val!.isEmpty ? 'please enter your name' : null,
            onChanged: (value) {
              name = value.trim().toLowerCase();
            },
          ),
          SizedBox(
            height: 20,
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
              email = value.trim().toLowerCase();
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
            inputAction: TextInputAction.next,
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
              if (password != confirmPassword) {
                setState(() {
                  notMatched = true;
                });
              } else {
                setState(() {
                  notMatched = false;
                });
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              // alignment: Alignment.center,
              child: Text(
            'Password must be atleast 8 character long, and must contain alphanumeric characters',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: kblack,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            'Confirm Password:',
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
            hintText: 'Please re enter your password',
            prefixIcon: Icon(Icons.password),
            inputType: TextInputType.text,
            inputAction: TextInputAction.done,
            // autovalidateMode: AutovalidateMode.always,
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
                return 'Please confirm  Password';
              }
              if (val.length < 8) {
                return 'Password must be more than 8 characters';
              }

              if (!numOrAlphaRegex.hasMatch(val)) {
                return 'Password must contain alphanumeric characters';
              }

              if (notMatched) {
                return 'Password don\'t match';
              }
              return null;
            },
            onChanged: (value) {
              confirmPassword = value.trim().toLowerCase();
              if (password != confirmPassword) {
                setState(() {
                  notMatched = true;
                });
              } else {
                setState(() {
                  notMatched = false;
                });
              }
            },
          ),
          SizedBox(
            height: 5,
          ),
          // Visibility(
          //   visible: notMatched,
          //   child: Container(
          //       alignment: Alignment.bottomLeft,
          //       child: Text(
          //         'Password don\'t match',
          //         style: TextStyle(
          //           fontSize: 13.0,
          //           fontWeight: FontWeight.bold,
          //           // fontFamily: 'Poppins',
          //           color: Colors.red[700],
          //         ),
          //       )),
          // ),
          SizedBox(
            height: 20,
          ),
          RoundedButton(
            color: Color(0xFF188906),
            text: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                //return to login page
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
