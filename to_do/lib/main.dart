import 'package:flutter/material.dart';
// import 'login.dart';
import 'todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
