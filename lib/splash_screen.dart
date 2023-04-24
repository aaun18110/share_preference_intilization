import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_preference/home_screen.dart';
import 'package:share_preference/student_screen.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int index = 5;
  @override
  void initState() {
    print("tap");
    super.initState();
    islogin();
  }

  void islogin() async {
    print("build");
    SharedPreferences sp = await SharedPreferences.getInstance();
    // sp.getBool("loggedin") == true ? run(): add();
    bool loggedin = sp.getBool("loggedin") ?? false;
    String studentType = sp.getString('userType') ?? '';
    if (loggedin) {
      if (studentType == 'student') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      } else {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Homescreen()));
        });
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LogIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
          child: const Image(
              fit: BoxFit.cover, image: (AssetImage('images/bg.jpg')))),
    );
  }

  // void run() {
  //   Timer(const Duration(seconds: 5), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const Homescreen()));
  //   });
  // }

  // void add() {
  //   Timer(const Duration(seconds: 5), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const LogIn()));
  //   });
  // }
}
