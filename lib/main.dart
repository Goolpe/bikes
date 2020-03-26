import 'package:bikes/shelf.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bikes>(
      create: (_) => Bikes(context: context)..fethData(),
      child: MaterialApp(
        title: 'Bikes',
        home: HomeScreen()
      )
    );
  }
}