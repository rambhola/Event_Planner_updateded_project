import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screen/Home_Page.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            height: 46,
            width: 46,
            top: 81,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("Assets/assets/assets/Left_Aero.png"),
            ),
          ),
          const Positioned(
            width: 162,
            height: 26,
            top: 145,
            left: 107,
            child: Center(
              child: Text(
                "OTP Verification",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: Color(0xff1E232C),
                  wordSpacing: -2,
                ),
              ),
            ),
          ),
          const Positioned(
            width: 331,
            height: 42,
            top: 186,
            left: 20,
            child: Center(
              child: Text(
                'Enter the verification code we just sent on your email address.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff8391A1),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300,right: 20,left:20 ),
                child: TextField(
                  controller: otpController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
                    suffixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text.toString(),
                    );

                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    });
                  } catch (ex) {
                    log(ex.toString());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1A9EB7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "VERIFY",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
