import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordpairWidget extends StatefulWidget {
  @override
  RandomwordState createState() => RandomwordState();
}

class RandomwordState extends State<WordpairWidget> {
  final wordPair = <WordPair>[];
  final favouriteWords = Set<
      WordPair>(); // set is a pair of words where each object can appear only once
  Widget buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        final index =
            item ~/ 1; // Calculate the index directly without checking isOdd
        if (index >= wordPair.length) {
          wordPair.addAll(generateWordPairs().take(10));
        }
        return buildRow(wordPair[index]);
      },
    );
  }

  Widget buildRow(WordPair word) {
    final alreadySaved = favouriteWords.contains(word);
    return ListTile(
      title: Text(word.asUpperCase, style: TextStyle(fontSize: 20)),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite,
          color: alreadySaved ? Colors.red : Colors.grey),
      onTap: () => {
        setState(() => {
              alreadySaved
                  ? favouriteWords.remove(word)
                  : favouriteWords.add(word)
            })
      },
    );
  }

  void favouriteFunction() {
    print('hello flutter how are u ');
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = favouriteWords.map((eachword) {
        return ListTile(
          title: Text(eachword.asPascalCase, style: TextStyle(fontSize: 18)),
        );
      });
      // You should convert the Iterable to a List if needed.
      final List<Widget> divider =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Favourite words')),
          body: ListView(
            children: divider,
          ));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordpair generator'),
        actions: <Widget>[
          IconButton(onPressed: favouriteFunction, icon: Icon(Icons.list))
        ],
      ),
      body: buildList(),
    );
  }
}
