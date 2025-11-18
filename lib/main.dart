import 'package:flutter/material.dart';
import 'package:mad_lesson1_2425/LikeButton.dart';
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
      appBar: AppBar(title: const Text('Posts')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Post 1'),
            trailing: LikeButton(),
          ),
          ListTile(
            title: Text('Post 2'),
            trailing: LikeButton(initialIsLiked: true),
          ),
          ListTile(
            title: Text('Post 3'),
            trailing: LikeButton(),
          ),
        ],
      ),
    );
  }
}
