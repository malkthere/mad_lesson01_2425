
import 'package:flutter/material.dart';
//import 'package:mad_lesson1_2425/main.dart';

class SecondScreen extends StatelessWidget {
  final String data;

  SecondScreen({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back to First Screen'),
            ),
            SizedBox(height: 20),
            Text(data)
          ],
        ),
      ),
    );
  }
}
