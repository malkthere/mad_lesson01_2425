//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mad_lesson1_2425/test.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Step 4: Dispose of the controller when it’s no longer needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextEditingController Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                // Step 2: Assign the controller to the TextField
                controller: _controller,
                decoration: InputDecoration(labelText: 'Enter some text'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Step 3: Access the text value from the controller
                  print('Text entered: ${_controller.text}');
      
                },
                child: Text('Print Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}