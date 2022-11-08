// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flashcards_zoan/koan.dart';


class KoanFlashCard extends StatelessWidget {
  final Koan koan = koans[currentIndex];
  KoanFlashCard({Key? key, required Koan koan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 350,
        minWidth: 350,
        minHeight: 350,
      ),
      child: flipCard(),
    );
  }

  Widget flipCard() {
    return FlipCard(
      front: Card(
        elevation: 4,
        // margin: EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              koan.koan,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      back: Card(
        elevation: 4,
        // margin: EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              koan.meaning,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KoanMeaningCard extends StatelessWidget {
  final Map koanInfo;

  const KoanMeaningCard({Key? key, required this.koanInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 350,
        maxWidth: 350,
        minHeight: 150,
      ),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              koanInfo['Meaning'],
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
