import 'package:ensemble/ensemble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const rootPage = String.fromEnvironment('page', defaultValue: 'Hello World');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ensemble().getPage(context, rootPage),
    );
  }
}


