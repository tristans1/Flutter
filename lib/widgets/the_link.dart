import 'package:flutter/material.dart';

Widget theLink(BuildContext context, String text, String routeName) {
  return  GestureDetector(
    child: Text(text, style : const TextStyle(decoration: TextDecoration.underline)),
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
  );
}