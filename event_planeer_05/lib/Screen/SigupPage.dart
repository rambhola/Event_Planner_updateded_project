import 'dart:convert';
import 'package:event_planeer_05/Screen/Home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/UIHelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Sign Up API call
  void signUp(String name, String email, String contact, String password) async {
    UIHelper.showLoadingDialog(context, "Creating new account...");

    try {
      final Uri apiUrl =
      Uri.parse("http://tutorials.codebetter.in:7087/auth/registercustomer");

      final response = await http.post(
        apiUrl,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'name': name,
          'email': email,
          'contact': contact,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Parse API response
        var responseData = json.decode(response.body);

        // Check for 'status' field and its value
        if (responseData["status"] == true) {
          print("Sign Up Successful!");
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          Navigator.pop(context);
          UIHelper.showAlertDialog(
            context,
            "Sign Up Failed",
            responseData['message'] ?? "Unknown error occurred.",
          );
        }
      } else {
        Navigator.pop(context);
        UIHelper.showAlertDialog(
          context,
          "An error occurred",
          "Unable to sign up. Please try again.",
        );
      }
    } catch (ex) {
      // Handle exceptions
      Navigator.pop(context);
      UIHelper.showAlertDialog(context, "An error occurred", ex.toString());
    }
  }

  // Function to check input values
  void checkValues() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String contact = contactController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || contact.isEmpty || password.isEmpty) {
      UIHelper.showAlertDialog(
        context,
        "Incomplete Data",
        "Please fill all the fields.",
      );
    } else {
      signUp(name, email, contact, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: contactController,
                    decoration: const InputDecoration(labelText: "Contact"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email Address"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: checkValues,
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontSize: 16),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
