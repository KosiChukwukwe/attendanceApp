// ignore_for_file: dead_code, prefer_const_constructors, unused_element, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:orginal_atteendance_app/screens/savingimages.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

final controller = TextEditingController();

class _GenerateQRCodeState extends State<GenerateQRCode> {
  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
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
      appBar: AppBar(
        backgroundColor: Color(0xFF188906),
        title: Text("GENERATE QR CODE"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
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
            buildTextField(context),
            SizedBox(
              height: 40,
            ),
            TextButton(
                child: Text('SAVE IMAGE'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color(0xFF188906),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const FirstSavingProcess()),
                  // );
                  ScreenshotWidget();
                }),
          ],
        ),
      )),
    );

    // Future<String> createQrPicture(String qr) async {
    //   String path = await createQrPicture(qr);

    //   await Share.shareFiles([path],
    //       mimeTypes: ["image/png"],
    //       subject: 'My QR code',
    //       text: 'Please scan me');

    //   return path;
    // }
  }
}
