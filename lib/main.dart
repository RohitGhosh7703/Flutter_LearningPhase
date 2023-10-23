import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.deepPurple),
        home: WordpairWidget());
  }
}

class WordpairWidget extends StatefulWidget {
  @override
  RandomwordState createState() => RandomwordState();
}

class RandomwordState extends State<WordpairWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Wordpair generator')),
        body: Text('this is the content inside the body property'));
  }
}
