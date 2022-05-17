import 'dart:async';
import 'package:ensemble/ensemble_home.dart';
import 'package:ensemble/ensemble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  late final Future initApp;

  @override
  void initState() {
    initApp = Ensemble().initialize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initApp,
        builder: (context, AsyncSnapshot snapshot) =>
          const MaterialApp(home: EnsembleHome())
    );
  }
}


