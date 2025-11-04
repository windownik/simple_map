
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/counter/presentation/pages/counter_page.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}
