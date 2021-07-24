import 'package:flutter/material.dart';
import 'package:first_app/first_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test one',
      theme: ThemeData(),
      home: FirstScreen(),
    );
  }
}
