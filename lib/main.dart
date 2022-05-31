import 'dart:async';
import 'package:ensemble/ensemble_home.dart';
import 'package:ensemble/ensemble.dart';
import 'package:ensemble/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main()  {
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
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              navigatorKey: Utils.globalAppKey,
              home: const EnsembleHome(),
              localizationsDelegates: [
                Ensemble().definitionProvider!.getI18NDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              builder: FlutterI18n.rootAppBuilder(),
            );
          }
          return const MaterialApp();
        }
    );
  }
}


