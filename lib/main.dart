import 'package:flutter/material.dart';
import 'package:mobx_news/hacker_news_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx News',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HackerNewsExample(),
    );
  }
}
