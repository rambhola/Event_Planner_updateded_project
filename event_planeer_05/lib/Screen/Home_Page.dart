
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AboutPage.dart';
import 'EnquiryPage.dart';
import 'EventPage.dart';
import 'GallaryPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<HomeScreen> {
  List imageList = [
    {"image_path": 'Assets/Images/SliderImages/slider01.jpg'},
    {"image_path": 'Assets/Images/SliderImages/slider02.jpg'},
    {"image_path": 'Assets/Images/SliderImages/slider03.jpg'}
  ];

  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List<String> events = [
    ('Wedding'),
    ('Engagement'),
    ('Birthday'),
    ('Baby Shower'),
    ('Anniversary'),
    ('Retirement Party'),
    ('Get-together'),
    ('Pool Party'),
    ('house party'),
    ('Holi Party'),
    ('Halloween'),
    ('Valentines Party'),
    ('Freshers Party'),
    ('Farewell Party'),
    ('Pre-Wedding Shoot'),
    ('Maternity Shoot'),
    ('Baby Shoot'),
  ];

  final List<Color> colors = [
    Color(0xffdfe2fd),
    Color(0xffF2D6BF),
    Color(0xffe3b2b1),
    Color(0xffdfe2fd),
    Color(0xffD99B82),
    Color(0xffb1ae99),
    Color(0xffACC4BE),
    Color(0xffEFDECD),
    Color(0xfff1e9b4),
    Color(0xfff2d4c9),
    Color(0xffe7c9b1),
    Color(0xffe5d5ed)
  ];

  int _selectedIndex = 0;

  void onBottomNavigatorButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
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
          MaterialPageRoute(builder: (context) => EventPage()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4391EC),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print(currentIndex);
                },
                child: CarouselSlider(
                  items: imageList.map((item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  ).toList(),
                  // carouselController: carouselController,
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
                      onTap: () =>
                          carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 3.0),
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
          Text(
            'Events',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: events.length,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  width: 450,
                  color: colors[index % colors.length],
                  child: Text(
                    events[index],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnquiryPage()),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
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
            label: 'EVENTS',
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
