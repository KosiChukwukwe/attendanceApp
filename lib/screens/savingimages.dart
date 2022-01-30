// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

double textSize = 20;

class ScreenshotWidget extends StatefulWidget {
  @override
  _ScreenshotWidgetState createState() => _ScreenshotWidgetState();
}

class _ScreenshotWidgetState extends State<ScreenshotWidget> {
  final GlobalKey _globalKey = GlobalKey();
  String screenshotButtonText = 'Save QRCode';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: RepaintBoundary(
        key: _globalKey,
        child: Container(
          child: SizedBox.expand(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
              onPressed: _saveScreenshot,
              child: Text(screenshotButtonText,
                  style: TextStyle(fontSize: textSize, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveScreenshot() async {
    setState(() {
      screenshotButtonText = 'saving in progress...';
    });
    try {
      //extract bytes
      final RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      //create file
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String fullPath = '$dir/${DateTime.now().millisecond}.png';
      File capturedFile = File(fullPath);
      await capturedFile.writeAsBytes(pngBytes);
      print(capturedFile.path);

      await GallerySaver.saveImage(capturedFile.path).then((value) {
        setState(() {
          screenshotButtonText = 'screenshot saved!';
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
