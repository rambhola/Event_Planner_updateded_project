import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AbooutPageState();
}

class _AbooutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('About', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff4391EC),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
                ''
                    'Welcome to Dreamy Events, where we specialize in crafting unforgettable events. Our personalized approach, innovative technology, and commitment to excellence ensure that every detail is meticulously planned and flawlessly executed. Trust us to make your event extraordinary',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }
}
