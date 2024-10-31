//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mad_lesson1_2425/SecondScreen.dart';
void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}


class _ProfileAppState extends State<ProfileApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  TextEditingController Textcontroller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: Textcontroller,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(data: Textcontroller.text)),
                );
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
