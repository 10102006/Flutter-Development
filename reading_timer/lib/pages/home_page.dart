import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = Duration();
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  void addSecond() {
    setState(() {
      duration = Duration(seconds: duration.inSeconds + 1);
    });
  }

  void startTimer() {
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) => addSecond());
  }

  @override
  Widget build(BuildContext context) {
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: duration.inMinutes / 60,
                  strokeWidth: 18,
                ),
                Center(
                  child: Text('${minutes}:${seconds}'),
                ),
              ],
            ),
          ),
          IconButton(onPressed: startTimer, icon: Icon(Icons.abc),)
        ],
      ),
    );
  }
}
