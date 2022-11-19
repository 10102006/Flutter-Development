import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_timer/anim.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            Navigator.push(
              context,
              RouteAnimator(0),
            );
          },
          child: const Text(
            "Read!",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
