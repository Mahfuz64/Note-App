import 'package:flutter/material.dart';
import 'package:mynote/screen/loginscreen.dart';
import 'package:mynote/utils/bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  autonavigate() async {
    await Future.delayed(Duration(seconds: 3));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = await prefs.getBool("islogin");
    if (value == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bottom()),
      );
    }
    else{

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
    );
    }
  }

  @override
  void initState() {
    autonavigate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "asset/Splashscreen.png",
              height: 200,
              width: 200,
            ),
          ),
          Text(
            "My Note",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
            ),
          ),
        ],
      ),
    );
  }
}
