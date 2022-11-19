import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_timer/session_data.dart';
import 'package:reading_timer/anim.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget ColorIcon(Color btnColor) {
    return IconButton(
      onPressed: () {
        setState(
          () {
            bookName = _textController.text;
            scheme = btnColor;
            Navigator.push(
              context,
              RouteAnimator(1),
            );
          },
        );
      },
      icon: Icon(
        Icons.circle,
        color: btnColor,
        size: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: GridView.count(
            crossAxisSpacing: 0.5,
            mainAxisSpacing: 1,
            crossAxisCount: 3,
            children: <Widget>[
              ColorIcon(CupertinoColors.activeBlue),
              ColorIcon(CupertinoColors.activeGreen),
              ColorIcon(CupertinoColors.activeOrange),
              ColorIcon(CupertinoColors.destructiveRed),
              ColorIcon(CupertinoColors.activeBlue),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CupertinoTextField(
        placeholder: 'Book Name',
        autofocus: true,
        padding: const EdgeInsets.all(8.0),
        textAlign: TextAlign.center,
        cursorHeight: 24,
        style: TextStyle(
          fontSize: 24,
          color: Color.fromARGB(255, 210, 210, 210),
        ),
        controller: _textController,
      ),
    );
  }
}
