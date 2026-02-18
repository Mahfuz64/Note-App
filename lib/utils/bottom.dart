import 'package:flutter/material.dart';
import 'package:mynote/screen/Profile.dart';
import 'package:mynote/screen/notes.dart';
import 'package:mynote/screen/trash.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int current = 0;
  List Screen = [allnote(), Trash(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Note"),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Trash"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedItemColor: Colors.red,
        elevation: 10,

        backgroundColor: Colors.lightGreen,
        onTap: (value) {
          current = value;
          setState(() {});
        },
      ),
    );
  }
}
