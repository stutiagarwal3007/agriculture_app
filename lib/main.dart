import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'start.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}