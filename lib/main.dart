import 'package:flutter/material.dart';

void main() {
  runApp(MyInteractiveApp());
}

class MyInteractiveApp extends StatefulWidget {
  @override
  _MyInteractiveAppState createState() => _MyInteractiveAppState();
}

class _MyInteractiveAppState extends State<MyInteractiveApp> {
  String message = 'ابداء الاستغفار';
  int counter = 0;
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;

  void updateMessage(String type,int count) {
    setState(() {
      message = type;
counter=count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('السبحة الالكترونية'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              Text("$counter"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                  counter1++;
                  updateMessage
                ('سبحان الله',counter1);},
                child: Text('سبحان الله'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                  counter2++;
                  updateMessage
                ('الحمدلله',counter2);},
                child: Text('الحمدلله'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                  counter3++;
                  updateMessage
                ('الله اكبر',counter3);},
                child: Text('الله اكبر'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
