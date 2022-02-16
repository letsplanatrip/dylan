import 'package:dylan/pages/home.dart';
import 'package:dylan/pages/iteranary.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/iteranary",
    routes: {
      "/": (context) => Home(),
      "/iteranary": (context) => Iteranary(),
    },
  ));
}
