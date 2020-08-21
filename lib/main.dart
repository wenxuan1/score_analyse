import 'package:flutter/material.dart';

import 'components/tabBars/TabBars.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ScoreApp(),
    );
  }
}

class ScoreApp extends StatefulWidget {
  @override
  _ScoreAppState createState() => _ScoreAppState();
}

class _ScoreAppState extends State<ScoreApp> {

  @override
  Widget build(BuildContext context) {
    return TabBars();
  }
}
