// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:orginal_atteendance_app/screens/dropdownbuttonclass.dart';
import 'package:orginal_atteendance_app/screens/scanqrcode.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  String? selectedValue;
  List<String> courses = [
    "CSC 499",
    "CSC 451",
    "CSC 211",
    "CSC 251",
    "CSC 351",
    "CSC 311",
    "CSC 101",
    "CSC 112",
  ];
  String? value;
  String qrcodeRes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF188906),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 120,
                  child: Text(
                    "Welcome...",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          //SizedBox(
          //width: 50,
          //),
          Center(
            child: Text(
              "Select the course code of \n"
              "the class you want to sign\n"
              "attendance for and click\n"
              "the button below",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomDropdownButton2(
            hint: 'Select Course',
            dropdownItems: courses,
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),

          TextButton(
            child: Text("SIGN-IN"),
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(11),
              primary: Colors.white,
              backgroundColor: Color(0xFF188906),
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              scanCode();
            },
          ),
        ],
      )),
    );
  }

  void scanCode() async {
    String res = await FlutterBarcodeScanner.scanBarcode(
        "#ffffff", 'Cancel', true, ScanMode.QR);

    print(res);

    setState(() {
      qrcodeRes = res;
    });
  }
}
