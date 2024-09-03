
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String Charactor = '';
  String SpecialCharactor = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController speacialCractactersController = TextEditingController();
  final TextEditingController RepeatPasswordController = TextEditingController();

  void submitFormData() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  void getFormData() {
    String formData = emailController.text +
        speacialCractactersController.text +
        RepeatPasswordController.text;
  }
  void navigateScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void callButtonPressed(){
    getFormData();
    navigateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            width: 194,
            height: 36,
            top: 121,
            left: 90,
            child: Text(
              "Create Account",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Positioned(
            width: 61,
            height: 24,
            top: 167,
            left: 161,
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Positioned(
            top: 265,
            left: 30,
            right: 30,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Opacity(
                        opacity: 0.3,
                        child: TextFormField(
                          controller: speacialCractactersController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Special Characters',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a Characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: TextFormField(
                        controller: RepeatPasswordController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Repeat Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Repeat Password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 585, left: 30),
            child: Container(
              height: 60,
              width: 315,
              child: ElevatedButton(
                onPressed: callButtonPressed,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1A9EB7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 675, left: 137),
            child: const Text(
              'Or Continue With',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 715,left: 25),
            child: SizedBox(
              width: 98.33,
              height: 57,
              child: Card(
                elevation: 50,
                shadowColor: Color(0xff0000000D),
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffF4F4F4)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            width: 19.32,
            height: 22.68,
            top: 720,
            left: 65,
            child: Image.asset('Assets/assets/assets/Applle_Logo.png', ),
          ),
          const Positioned(
              height: 18,
              width: 35,
              top: 749,
              left: 57,
              child: Text('Apple',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.w400,fontSize: 12, ),) ),
          Padding(
            padding: const EdgeInsets.only(top: 715,left: 138),
            child: SizedBox(
              width: 98.33,
              height: 57,
              child: Card(
                elevation: 50,
                shadowColor: Color(0xff0000000D),
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffF4F4F4)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            width: 19.32,
            height: 22.68,
            top: 720,
            left: 177,
            child: Image.asset('Assets/assets/assets/Google_Icons.png', ),
          ),
          const Positioned(
              height: 18,
              width: 44,
              top: 749,
              left: 165,
              child: Text('Google',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.w400,fontSize: 12, ),) ),

          Padding(
            padding: const EdgeInsets.only(top: 715,left: 252),
            child: SizedBox(
              width: 98.33,
              height: 57,
              child: Card(
                elevation: 50,
                shadowColor: Color(0xff0000000D),
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffF4F4F4)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            width: 19.32,
            height: 22.68,
            top: 720,
            left: 290,
            child: Image.asset('Assets/assets/assets/Facebook_Logo.png'),
          ),
          const Positioned(
              height: 18,
              width: 59,
              top: 749,
              left: 272,
              child: Text('Facebook',style: TextStyle(fontFamily:'Poppins',fontWeight: FontWeight.w400,fontSize: 12, ),) ),
        ],
      ),
    );
  }
}
