import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

final List<WordPair> _randomWordPairs = <WordPair>[];
final Set _savedWordPairs = Set<WordPair>();

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(28),
      itemBuilder: ((BuildContext context, int item) {
        if (item.isOdd) return const Divider();

        final int index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildTile(_randomWordPairs[index]);
      }),
    );
  }

  Widget _buildTile(WordPair pair) {
    final bool alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: const TextStyle(fontSize: 20.0),
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.pink : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _savedWordPairs.remove(pair);
            } else {
              _savedWordPairs.add(pair);
            }
          });
        });
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LikedWordsRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WordPair Generator"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildList(),
    );
  }
}

class LikedWordsRoute extends StatelessWidget {
  const LikedWordsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like Words'),
        centerTitle: true,
      ),
      body: _likedWordTiles(),
    );
  }

  Widget _likedWordTiles() {
    final Iterable<ListTile> entries = _savedWordPairs.map((pair) => ListTile(
        title: Text(pair.toString(), style: const TextStyle(fontSize: 20.0))));

    return ListView.separated(
      padding: const EdgeInsets.all(28),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return entries.elementAt(index);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
