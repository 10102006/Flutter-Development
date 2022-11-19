// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _TimerState();
}

class _TimerState extends State<Counter> {
  Duration duration = Duration();
  String twoDigits(int? n) => n.toString().padLeft(2, '0');
  Timer? timer;
  bool isRunning = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void pauseSwitch() {
    setState(() {
      isRunning = timer == null ? false : (timer!.isActive);

      if (isRunning) {
        timer?.cancel();
      } else {
        startTimer();
      }
    });
  }

  void addSecond() {
    setState(() {
      duration = Duration(seconds: duration.inSeconds + 1);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) => addSecond());
  }

  @override
  Widget build(BuildContext context) {
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: ((duration.inSeconds) % 60) / 60,
                    backgroundColor: Color.fromARGB(113, 197, 207, 212),
                    strokeWidth: 14,
                  ),
                  Center(
                    child: Text('${minutes}:${seconds}',
                        style: const TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              thickness: 1.3,
              indent: 20,
              endIndent: 20,
            ),
            IconButton(
              onPressed: pauseSwitch,
              icon: Icon(timer!.isActive ? Icons.pause : Icons.play_arrow),
              iconSize: 25,
            )
          ],
        ),
      ),
    );
  }
}
