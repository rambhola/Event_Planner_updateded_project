import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_planeer_05/Screen/ServiceMasterList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Model/EventListModel.dart';
import 'AboutPage.dart';
import 'EnquiryPage.dart';
import 'EventPage.dart';
import 'GallaryPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Slider Images
  final List<Map<String, String>> imageList = [
    {"image_path": 'Assets/Images/SliderImages/slider01.jpg'},
    {"image_path": 'Assets/Images/SliderImages/slider02.jpg'},
    {"image_path": 'Assets/Images/SliderImages/slider03.jpg'}
  ];

  CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  // Bottom Navigation
  int _selectedIndex = 0;

  void onBottomNavigatorButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GallaryPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceListUI()),
        );
        break;
    }
  }

  // Fetch Event List from API
  Future<List<EventListModel>> getList() async {
    try {
      final response = await get(
        Uri.parse('http://tutorials.codebetter.in:7087/auth/events/list'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] is List) {
          final List<dynamic> dataList = jsonResponse['data'];
          return [
            EventListModel(
              status: jsonResponse['status'] ?? false,
              message: jsonResponse['message'] ?? '',
              data: dataList.map((item) => Data.fromJson(item)).toList(),
            )
          ];
        } else {
          log('Error: "data" field is not a List in the response');
          return [];
        }
      } else {

        log('Error: HTTP ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Exception: $e');
      return [];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color(0xff4391EC),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.message)),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slider Section
          Stack(
            children: [
              InkWell(
                onTap: () {
                  log('Current Index: $currentIndex');
                },
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => Image.asset(
                          item['image_path']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.teal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Events List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          // Events List Section
          Expanded(
            child: FutureBuilder<List<EventListModel>>(
              future: getList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  log("Error: ${snapshot.error}");
                  return const Center(child: Text('Failed to load events.'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No events found.'));
                } else {
                  final events = snapshot.data!.first.data;
                  return ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Colors.yellowAccent[100],
                            title: Text(
                              event.eventName ,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold,wordSpacing: 2),
                            ),
                          ));
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnquiryPage()),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
            backgroundColor: Color(0xff4391EC),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'ABOUT US',
            backgroundColor: Color(0xff4391EC),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'GALLERY',
            backgroundColor: Color(0xff4391EC),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'SERVICE LIST',
            backgroundColor: Color(0xff4391EC),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onBottomNavigatorButtonTapped,
      ),
    );
  }
}

extension on CarouselController {
  animateToPage(int key) {}
}
