import 'dart:async';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3 ), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4391EC),
      body: Stack(
        children: [
          Center(
            child: Image.asset('Assets/Images/logo_prev_ui.png'),
          )
        ],
      ),
    );
  }
}
