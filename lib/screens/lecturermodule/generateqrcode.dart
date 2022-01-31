// ignore_for_file: dead_code, prefer_const_constructors, unused_element, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orginal_atteendance_app/screens/onArrivalPage.dart';

import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

final controller = TextEditingController();
bool _isVisible = false;

class _GenerateQRCodeState extends State<GenerateQRCode> {
  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: _isVisible ? false : true,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
        ],
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        decoration: InputDecoration(
            hintText: "Enter the secret code",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFF188906))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF188906)),
            ),
            suffixIcon: IconButton(
              color: Color(0xFF188906),
              icon: Icon(
                Icons.done,
                size: 25,
              ),
              onPressed: () => setState(() {}),
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF188906),
        title: Text("GENERATE QR CODE"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QrImage(
              data: controller.text,
              size: 200,
              backgroundColor: Colors.grey.shade200,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "SET SECRET CODE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF188906)),
            ),
            SizedBox(
              height: 30,
            ),
            buildTextField(context),
            SizedBox(
              height: 40,
            ),
            TextButton(
                child: Text('DONE'),
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
                    MaterialPageRoute(builder: (context) => onArrivalPage()),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
