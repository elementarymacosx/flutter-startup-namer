import 'package:flutter/material.dart';
import 'package:async/src/async_cache.dart';
import 'package:async/async.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

//Stateful widgets maintain state that might change during the lifetime of the widget.
// Implementing a stateful widget requires at least two classes: 1) a StatefulWidget class that creates
// an instance of 2) a State class.
// The StatefulWidget class is, itself, immutable, but the State class persists over the lifetime of the widget.

//the generic State class specialized for use with RandomWords

//ListView’s builder factory constructor allows you to build a list view lazily, on demand.


class RandomWordsState extends State<RandomWords>
{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  //Prefixing an identifier with an underscore enforces privacy in the Dart language.

  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  _buildSuggestions()
  {
    return ListView.builder
      (
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i)
        {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if(index >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));
          return _buildRow(_suggestions[index]);
        }
      );
  }

  Widget _buildRow(WordPair wordpair)
  {
    return ListTile
    (
      title: Text
      (
        wordpair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget
{
  @override
//  State<StatefulWidget> createState()
//  {
//    // TODO: implement createState
//    return null;
//  }
  RandomWordsState createState() => RandomWordsState();
}