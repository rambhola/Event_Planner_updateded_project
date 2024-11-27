
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
class EventPage extends StatefulWidget {
  @override
  EventPageState createState() => EventPageState();
}

class EventPageState extends State<EventPage> {
  String? dropdownvalue = 'select event';
  int currentIndex = 0;

  get http => null;

  // Future<List<serviceListRequest>> getService() async {
  //   String api = "http://tutorials.codebetter.in:7087/api/servicemaster/list";
  //   final response = await http.get(Uri.parse(api));
  //   print("Response Object is: ${response}");
  //   print("Response Body Is: ${response.body}");
  //
  //   var data = jsonDecode(response.body);
  //
  //   if (data['status']) {
  //     print('Success Response: ${data}');
  //     List<serviceListRequest> services = (data['data'] as List)
  //         .map((service) => serviceListRequest.fromJSON(service))
  //         .toList();
  //     return services;
  //   } else {
  //     print("Response Failed: ${data}");
  //     throw Exception("Failed");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown List"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FutureBuilder<List<serviceListRequest>>(
              //   future: getService(),
              //   // snapshots is data
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              //       var data = snapshot.data!;
              //       return DropdownButton<String>(
              //         value: dropdownvalue,
              //         icon: const Icon(Icons.keyboard_arrow_down),
              //         items: data.map((serviceListRequest item) {
              //           return DropdownMenuItem<String>(
              //             value: item.service_name,
              //             child: Text(item.service_name ?? ''),
              //           );
              //         }).toList(),
              //         onChanged: (String? newValue) {
              //           setState(() {
              //             dropdownvalue = newValue!;
              //           });
              //         },
              //       );
              //     } else {
              //       return const Text('No data available');
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
