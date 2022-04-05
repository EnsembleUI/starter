import 'package:ensemble/ensemble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const initialPage = String.fromEnvironment('page', defaultValue: 'Hello World');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Ensemble().initialize(context),
        builder: (context, AsyncSnapshot snapshot) => MaterialApp(
          home: Ensemble().getPage(context, initialPage),
        )
    );
  }
}


