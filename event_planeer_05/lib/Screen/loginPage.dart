import 'package:event_planeer_05/Screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Model/UIHelper.dart';
import 'Home_Page.dart';
import 'SigupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function to log in with email and password
  void logIn(String email, String password) async {
    UIHelper.showLoadingDialog(context, "Logging In..");

    try {
      final Uri apiUrl = Uri.parse("http://tutorials.codebetter.in:7087/auth/login");

      final response = await http.post(
        apiUrl,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        if (responseData["status"] == true) {
          print("Log In Successful!");
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          Navigator.pop(context);
          UIHelper.showAlertDialog(context, "Login Failed", responseData['message']);
        }
      } else {
        Navigator.pop(context);
        UIHelper.showAlertDialog(context, "An error occurred", "Unable to log in. Please try again.");
      }
    } catch (ex) {
      Navigator.pop(context);
      UIHelper.showAlertDialog(context, "An error occurred", ex.toString());
    }
  }

  // Function to check if the input values are valid
  void checkValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    } else {
      logIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Event Planner",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email Address"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: () async {
                      // Validate input fields
                      checkValues();

                      // If credentials are correct, save login state in SharedPreferences
                      final sharedPref = await SharedPreferences.getInstance();

                      // Assuming login is successful, set the login state
                      sharedPref.setBool(SplashScreenState.keyLogin, true);

                      // Navigate to the HomeScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text("Log In"),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
