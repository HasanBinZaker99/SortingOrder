import 'package:flutter/material.dart';
import 'package:key_setup_app/keys/keys.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Let's say we have a list of numbers.
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Internals"),
        ),
        body: const Keys(),
      ),
    );
  }
}
