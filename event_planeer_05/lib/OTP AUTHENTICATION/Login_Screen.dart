
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screen/SignUpScreen.dart';
import 'otp_Screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          Positioned(
              width: 54,
              height: 21,
              top: 12,
              left: 20,
              child: Image.asset(
                "Assets/assets/assets/left_side_status_bar.png",
              )),
          Positioned(
              width: 66.66,
              height: 11.34,
              top: 17.33,
              left: 293.67,
              child: Image.asset(
                  "Assets/assets/assets/right_side_networkbar.png")),
          Positioned(
            width: 149.34,
            height: 79.53,
            top: 89.36,
            left: 112.83,
            child: Image.asset("Assets/Images/app_logo.png"),
          ),
          const Positioned(
            width: 194,
            height: 36,
            top: 213,
            left: 90,
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
          ),
          const Positioned(
              width: 135,
              height: 24,
              top: 259,
              left: 118,
              child: Text(
                'login with phone',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )),
          Positioned(
              width: 315,
              height: 48,
              top: 320,
              left: 30.64,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone_android_outlined),
                ),
              )),
          Positioned(
            height: 60,
            width: 315,
            top: 398,
            left: 30.64,
            child: ElevatedButton(
              onPressed: () async {

                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpScreen(verificationId: verificationId)));
                  },
                  phoneNumber: phoneController.text.toString(),
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: Text(
                'GET OTP',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(26, 158, 183, 1),
                ),
              ),
            ),
          ),

          const Positioned(
              width: 102,
              height: 20,
              top: 550,
              left: 131.64,
              child: Text(
                'Or Continue With',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              )),
          Positioned(
            top: 620,
            left: 120.64,
            child: Center(
                child: Image.asset(
              "Assets/assets/assets/Google_Icons.png",
              width: 20,
              height: 20,
            )),
          ),
          const Positioned(
            height: 18,
            width: 44,
            top: 648,
            left: 108.64,
            child: Center(
                child: Text(
              "Google",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            )),
          ),
          Positioned(
            top: 618,
            left: 233.64,
            child: Center(
                child: Image.asset(
              "Assets/assets/assets/Facebook_Logo.png",
              width: 24,
              height: 24,
            )),
          ),
          const Positioned(
            height: 18,
            width: 59,
            top: 648,
            left: 215.64,
            child: Center(
                child: Text(
              "Facebook",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            )),
          ),
          Positioned(
            width: 218,
            height: 30,
            top: 736,
            left: 78.64,
            child: GestureDetector(
              child: Image.asset("Assets/assets/assets/ForgotPasswordLink.png"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
                // here we will navigate to the signup page
              ),
            ),
          ),
        ],
      ),
    );
  }
}
