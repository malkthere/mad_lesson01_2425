import 'package:flutter/material.dart';
import 'package:mad_lesson1_2425/SecondScreen.dart';
import 'package:mad_lesson1_2425/AboutScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/SecondPage': (context) => const SecondPage(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
             ElevatedButton(
              onPressed: () async{
                final result = await Navigator.pushNamed(
                  context,'/SecondPage'
                )as bool?;
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result?'You selected accept':'you selected not to accept')),
                  );
                }
                },
               child: const Text('Go to selection screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Go to About'),
            ),
          ],
        ),
      ),
    );
  }
}
