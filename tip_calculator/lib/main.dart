import 'package:flutter/material.dart';
import 'package:tip_calculator/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF56F569),
          //accentColor: Colors.white,
          hintColor: Colors.grey),
      home: HomePage(),
    );
  }
}
