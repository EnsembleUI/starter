import 'package:ensemble/ensemble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        return Ensemble().getPageRoute('Hello World');
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("Unknown route"));
    }
  }
}


