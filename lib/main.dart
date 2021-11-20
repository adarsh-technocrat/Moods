import 'package:flutter/material.dart';
import 'package:moods/pages/HomePage/HomePage.dart';
import 'package:moods/provider/readJsonDataProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReadJsonDataProvider>(
          create: (_) => ReadJsonDataProvider(),
        )
      ],
      child: MaterialApp(
        title: "Moods - Relax and focus on work through ambient nature sound",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Poppins",
        ),
        home: HomePage(),
      ),
    );
  }
}
