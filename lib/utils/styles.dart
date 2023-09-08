import 'package:flutter/material.dart';

TextStyle headingStyle = const TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w800,
);


TextStyle subtitleStyle = const TextStyle(
  fontSize: 24,
  color: Colors.tealAccent,
);

ButtonStyle buttonStyle =  ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size(200, 50)),
  textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.w800)),
);