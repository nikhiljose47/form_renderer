import 'package:flutter/material.dart';
import 'package:form_renderer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple.shade300,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form renderer'),
          backgroundColor: const Color.fromARGB(255, 223, 161, 232),
          elevation: 3,
          shadowColor: const Color.fromARGB(127, 0, 0, 0),
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
