import 'package:covid19_tracker/homepage.dart' show HomePage;
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor: Colors.blueGrey[800],
    ),
    home: HomePage(),
  ));
}
