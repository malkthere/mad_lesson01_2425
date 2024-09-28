import 'package:flutter/material.dart';

void main() {
  runApp(MyLifecycleApp());
}

class MyLifecycleApp extends StatefulWidget {
  @override
  _MyLifecycleAppState createState() => _MyLifecycleAppState();
}

class _MyLifecycleAppState extends State<MyLifecycleApp> {
  @override
  void initState() {
    super.initState();
    print("initState called");
  }

  @override
  void dispose() {
    print("dispose called");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget Lifecycle'),
        ),
        body: Center(
          child: Text('Check the console for lifecycle methods.'),
        ),
      ),
    );
  }
}
