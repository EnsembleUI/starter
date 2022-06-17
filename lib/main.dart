import 'package:ensemble/ensemble_home.dart';
import 'package:ensemble/ensemble.dart';
import 'package:ensemble/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Ensemble().initialize();
  runApp(const Home());
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Utils.globalAppKey,
        localizationsDelegates: [
          Ensemble().definitionProvider!.getI18NDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],home: const EnsembleHome(),
        theme: Ensemble().getAppTheme(),
        builder: FlutterI18n.rootAppBuilder(),
    );
  }
}