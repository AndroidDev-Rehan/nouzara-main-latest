import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nzeora/Screens/Authentication/SignIn.dart';
import 'package:nzeora/Screens/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getString("email") != null &&
          prefs.getString("token") != null &&
          prefs.getBool("isLoggedIn") == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 100,
          color: Colors.white,
          child: Image.asset(
            'assets/images/NzeoraLogoB.png',
          ),
        ),
      ),
    );
  }
}
