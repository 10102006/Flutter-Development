// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget roundButton(String btnText, Color btnColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        evaluate(btnText);
      },
      style: ElevatedButton.styleFrom(
        primary: btnColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(30.0),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          color: textColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Output Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Grid Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              roundButton("C", (Colors.grey[900])!, Colors.redAccent),
              roundButton("<", Colors.grey, Colors.black),
              roundButton("%", Colors.grey, Colors.black),
              roundButton("/", Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              roundButton("7", (Colors.grey[850]!), Colors.white),
              roundButton("8", (Colors.grey[850]!), Colors.white),
              roundButton("9", (Colors.grey[850]!), Colors.white),
              roundButton("*", Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              roundButton("4", (Colors.grey[850]!), Colors.white),
              roundButton("5", (Colors.grey[850]!), Colors.white),
              roundButton("6", (Colors.grey[850]!), Colors.white),
              roundButton("-", Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              roundButton("1", (Colors.grey[850]!), Colors.white),
              roundButton("2", (Colors.grey[850]!), Colors.white),
              roundButton("3", (Colors.grey[850]!), Colors.white),
              roundButton("+", Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: (Colors.grey[850]!),
                  padding: EdgeInsets.fromLTRB(80, 25, 80, 25),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              roundButton(".", (Colors.grey[850]!), Colors.white),
              roundButton("=", Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  // Logic
  int firstNum = 0;
  int secNum = 0;
  String result = '0';
  String text = '0';
  String operation = '';

  void evaluate(String btnText) {
    if (btnText == 'C') {
      firstNum = 0;
      secNum = 0;
      result = '';
      text = '0';
      operation = '';
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '*' ||
        btnText == '/' ||
        btnText == '%') {
      firstNum = int.parse(text);
      result = '';
      operation = btnText;
    } else if (btnText == '=') {
      secNum = int.parse(text);
      if (operation == '/') {
        result = (firstNum / secNum).toString();
      }
      if (operation == '*') {
        result = (firstNum * secNum).toString();
      }
      if (operation == '+') {
        result = (firstNum + secNum).toString();
      }
      if (operation == '-') {
        result = (firstNum - secNum).toString();
      }
      if (operation == '%') {
        result = (firstNum % secNum).toString();
      }
    } else if (btnText == '<') {
      result = text.substring(0, (text.length - 1));
    } else {
      result = (text + btnText);
    }

    setState(() {
      text = result;
    });
  }
}
