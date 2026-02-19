import 'package:flutter/material.dart';
import 'package:mynote/screen/Viewnote.dart';
import 'package:mynote/screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple),fontFamily: "Times New Roman"),
      home: const Splashscreen(),
    );
  }
}

