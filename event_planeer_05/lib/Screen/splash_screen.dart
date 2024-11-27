import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_Page.dart';
import 'loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String keyLogin = "login";

  @override
  void initState() {
    super.initState();
    whereToGo(); // Determine navigation destination on splash screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4391EC),
      body: Stack(
        children: [
          Center(
            child: Image.asset('Assets/Images/logo_prev_ui.png'),
          ),
        ],
      ),
    );
  }

  // Determine the navigation path based on shared preferences
  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keyLogin);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null && isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }
}
