import 'package:flutter/material.dart';
import 'package:todo2/myappbar.dart';
import 'package:todo2/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: MyAppBar()),
        body: Todo(),
      ),
    );
  }
}
