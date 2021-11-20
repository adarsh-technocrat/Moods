import 'package:flutter/material.dart';
import 'package:moods/pages/HomePage/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moods - Relax and focus on work through ambient nature sound",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
      ),
      home: HomePage(),
    );
  }
}
