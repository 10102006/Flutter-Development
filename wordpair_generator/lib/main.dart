import 'package:flutter/material.dart';
import 'package:wordpair_generator/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: RandomWords(),
      debugShowCheckedModeBanner: false,
    );
  }
}


