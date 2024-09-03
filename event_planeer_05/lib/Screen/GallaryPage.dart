import 'package:flutter/material.dart';

class GallaryPage extends StatefulWidget {
  // const GallaryPage({super.key});
  @override
  State<GallaryPage> createState() => _GallaryPageState();
}

class _GallaryPageState extends State<GallaryPage> {
  List<String> GallaryImages = [
    ('Assets/Images/GallaryImages/gallery01.jpg'),
    ('Assets/Images/GallaryImages/gallery02.jpg'),
    ('Assets/Images/GallaryImages/gallery03.jpg'),
    ('Assets/Images/GallaryImages/gallery04.jpg'),
    ('Assets/Images/GallaryImages/gallery06.jpg'),
    ('Assets/Images/GallaryImages/gallery07.jpg'),
    ('Assets/Images/GallaryImages/gallery08.jpg'),
    ('Assets/Images/GallaryImages/gallery09.jpg'),
    ('Assets/Images/GallaryImages/gallery10.jpg'),
    ('Assets/Images/GallaryImages/gallery12.jpg'),
    ('Assets/Images/GallaryImages/gallery13.jpg'),
    ('Assets/Images/GallaryImages/gallery14.jpg'),
    ('Assets/Images/GallaryImages/gallery15.jpg'),
    ('Assets/Images/GallaryImages/gallery16.jpg'),
    ('Assets/Images/GallaryImages/gallery17.jpg'),
    ('Assets/Images/GallaryImages/gallery18.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallary', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff4391EC),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: GallaryImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(GallaryImages[index]);
          },
        ),
      ),
    );
  }
}
