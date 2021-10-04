import 'package:flutter/material.dart';
import 'package:tip_calculator/HomePage.dart';

class AmountText extends StatelessWidget {
  final String text;

  const AmountText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF010101),
          fontSize: 20,
        ),
      ),
    );
  }
}
