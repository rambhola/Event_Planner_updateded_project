import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/ServiceModel.dart';

class ServiceMasterList {
  Future<List<ServiceModel>> getList() async {
    try {
      final response = await http.get(
        Uri.parse('http://tutorials.codebetter.in:7087/auth/servicemaster/list'),
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        if (jsonResponse['data'] is List) {
          final List<dynamic> data = jsonResponse['data'];

          List<ServiceModel> serviceList = [];
          for (var item in data) {
            serviceList.add(ServiceModel.fromJson(item));
          }
          return serviceList;

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
}

class ServiceListUI extends StatefulWidget {
  const ServiceListUI({super.key});

  @override
  State<ServiceListUI> createState() => _ServiceListUIState();
}

class _ServiceListUIState extends State<ServiceListUI> {
  final ServiceMasterList _serviceMasterList = ServiceMasterList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Service List"),
      ),
      body: FutureBuilder<List<ServiceModel>>(
        future: _serviceMasterList.getList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            debugPrint("Error: ${snapshot.error}");
            return const Center(child: Text('Failed to load services.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No services found.'));
          } else {
            final serviceList = snapshot.data!;
            return ListView.builder(
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                final service = serviceList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.yellowAccent[100],
                    title: Text(
                      service.service_name.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                      ),
                    ),
                    subtitle: Text(service.createdAt.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
