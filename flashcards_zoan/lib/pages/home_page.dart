// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flashcards_zoan/koan.dart';
import 'package:flashcards_zoan/koan_view.dart';
import 'package:flashcards_zoan/pages/koan_interpretation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KoanFlashCard(koan: koans[currentIndex]),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: likeKoan,
                iconSize: 25,
                padding: EdgeInsets.all(8.0),
                icon: Icon(
                  Icons.favorite,
                  color: koans[currentIndex].liked == true
                      ? Colors.pink
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: addInterpretation,
                iconSize: 25,
                icon: Icon(Icons.add),
                padding: EdgeInsets.all(8.0),
              ),
              IconButton(
                onPressed: nextKoan,
                iconSize: 25,
                padding: EdgeInsets.all(8.0),
                icon: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ],
      ),
    );
  }

  likeKoan() {
    setState(() {
      koans[currentIndex].likeKoan();
    });
  }

  addInterpretation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KoanInterpretations()),
    );
  }

  nextKoan() {
    setState(() {
      currentIndex = currentIndex + 1 < koans.length ? currentIndex + 1 : 0;
    });
  }
}
