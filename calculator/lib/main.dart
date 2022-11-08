// ignore_for_file: prefer_const_constructors
// TODO Make it more streamlined and not hard-coded, also integrate light-dark view mode

import 'package:flutter/material.dart';
import 'calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.black,
      ),
      body: Calculator(),
      backgroundColor: Colors.black,
    );
  }
}
