import 'package:flutter/material.dart';
import 'package:mad_lesson1_2425/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Return Data Demo',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            final result = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectionScreen(),
              ),
            );
            if (result != null) {
              bool isOk;
              if (result.toLowerCase() == 'true') {
                isOk = true;
              } else {
                isOk = false;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(isOk ?'تمت الموافقة على الشروط':'تم رفض الشروط')),
              );
            }
          },
          child: const Text('Go to selection screen'),
        ),
      ),
    );
  }

}
