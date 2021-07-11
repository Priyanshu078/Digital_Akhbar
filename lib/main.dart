import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Akhbar',
      debugShowCheckedModeBanner: false,
      home: Categories(title: 'Digital Akhbar'),
    );
  }
}
