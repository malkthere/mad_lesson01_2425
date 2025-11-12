import 'package:flutter/material.dart';
import 'UserInfoCard.dart'; // assume it is in a separate file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget Demo',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students List')),
      body: ListView(
        children: const [
          UserInfoCard(
            name: 'Ali Ahmed',
            email: 'ali@example.com',
            role: 'Student',
          ),
          UserInfoCard(
            name: 'Sara Hassan',
            email: 'sara@example.com',
            role: 'Student',
          ),
          UserInfoCard(
            name: 'Dr. Mazin',
            email: 'teacher@example.com',
            role: 'Teacher',
          ),
          UserInfoCard(
            name: 'Dr. Mazin',
            email: 'teacher@example.com',
            role: 'Teacher',
          ),
        ],
      ),
    );
  }
}
