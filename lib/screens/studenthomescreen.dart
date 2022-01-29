// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                height: 20,
              ),
              Center(
                  child: Text(
                      "Select the course code of the class you want to sign attendance for and click the button below")),
              SizedBox(
                height: 20,
              ),
              DropDownField(
                controller: coursesSelected,
                hintText: "Select a course ",
                enabled: true,
                itemsVisibleInDropdown: 8,
                items: courses,
                onValueChanged: (value) {
                  setState(() {
                    selectCourse = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                selectCourse,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}

String selectCourse = "";

final coursesSelected = TextEditingController();

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
