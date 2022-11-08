// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flashcards_zoan/pages/home_page.dart';

void main() => runApp(MyApp());

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
