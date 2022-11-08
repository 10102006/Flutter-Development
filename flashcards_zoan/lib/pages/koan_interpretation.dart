// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flashcards_zoan/koan.dart';
import 'package:flashcards_zoan/koan_view.dart';

class KoanInterpretations extends StatefulWidget {
  const KoanInterpretations({Key? key}) : super(key: key);

  @override
  State<KoanInterpretations> createState() => _KoanInterpretationsState();
}

class _KoanInterpretationsState extends State<KoanInterpretations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MeaningCards(),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    final formKey = GlobalKey<FormState>();
    final koanController = TextEditingController();

    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: koanController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  koans[currentIndex].addInterpretation(
                      '${DateTime.now().day}/${DateTime.now().month}',
                      koanController.text);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MeaningCards extends StatelessWidget {
  const MeaningCards({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 350,
              maxWidth: 350,
              minHeight: 350,
            ),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    koans[currentIndex].meaning,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ])),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            ((context, index) =>
                KoanMeaningCard(koanInfo: koanInterpretations[index])),
            childCount: koanInterpretations.length,
          ),
        ),
      ],
    );
  }
}
