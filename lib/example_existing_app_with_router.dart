import 'package:ensemble/ensemble.dart';
import 'package:ensemble/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Ensemble().initialize();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: Utils.globalAppKey,
      localizationsDelegates: [
        Ensemble().definitionProvider!.getI18NDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      builder: FlutterI18n.rootAppBuilder(),
      theme: Ensemble().getAppTheme(),
      initialRoute: Router.home,
      onGenerateRoute: Router.handleGenerateRoute,
    );
  }
}


class ExistingFlutterPage extends StatelessWidget {
  const ExistingFlutterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My existing App with Router')
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Load Ensemble Page"),
          onPressed: () => Navigator.of(context).pushNamed(Router.ensemble)
        ),
      ),
    );
  }
}

class Router {
  static const String home = '/';
  static const String ensemble = '/ensemble';

  static Route<dynamic> handleGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const ExistingFlutterPage());
      case ensemble:
        return Ensemble().getAppRoute();
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("Unknown route"));
    }
  }
}


