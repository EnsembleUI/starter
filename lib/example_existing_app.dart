import 'package:ensemble/ensemble.dart';
import 'package:flutter/material.dart';

/// demonstrating Ensemble integration with your existing Flutter App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Existing App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    // Ensemble will auto-initialize once upon loading the first page.
    // However you can pre-initialize to make the first page load faster
    Ensemble().initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Load Ensemble Page"),
          onPressed: () => loadEnsemblePage(context),
        )
      )
    );
  }

  void loadEnsemblePage(BuildContext context) {
    // Navigating to the home page of the configured App
    Ensemble().navigateApp(context);

    // navigate to a specific screen using ID or name
    //Ensemble().navigateApp(context, screenName: 'Goodbye');
  }
}