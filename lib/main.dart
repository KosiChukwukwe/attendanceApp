import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orginal_atteendance_app/screens/onArrivalPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: onArrivalPage(),
    );
  }
}
