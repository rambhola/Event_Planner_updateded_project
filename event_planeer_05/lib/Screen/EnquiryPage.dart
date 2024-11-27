
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnquiryPage extends StatefulWidget {
  // const EnquiryPage({super.key});

  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  final _formKey = GlobalKey<FormState>();
  final _textNameController = TextEditingController();
  final _contactController = TextEditingController();
  final _altContactController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int currentIndex = 0;

  List<String> events = [
    'Choose Event Type',
    'Engagement',
    'Wedding',
    'Birthday',
    'Baby Shower',
    'Anniversary',
    'Retirement Party',
    'Get-together',
    'Pool Party',
    'House Party',
    'Holi Party',
    'Halloween',
    'Valentines Party',
    'Freshers Party',
    'Farewell Party',
    'Pre-Wedding Shoot',
    'Maternity Shoot',
    'Baby Shoot',
  ];

  String _selectedValue = "Choose Event Type";

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
    Color(0xffe5d5ed),
  ];

  // Function to show Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2028),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _updateDateTimeController();
      });
    }
  }

  // Function to update DateTime Controller
  void _updateDateTimeController() {
    if (_selectedDate != null && _selectedTime != null) {
      final DateTime dateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
      _eventDateController.text =
      "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    } else if (_selectedDate != null) {
      _eventDateController.text =
      "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}";
    }
  }
  //
  // Future<void> _navigateToAdminPanel() async {
  //   const String adminPanelUrl = "http://tutorials.codebetter.in:4012/";
  //
  //   if (await canLaunch(adminPanelUrl)) {
  //     await launch(adminPanelUrl);
  //   } else {
  //     throw 'Could not launch $adminPanelUrl';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquiry', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff4391EC),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textNameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  icon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _contactController,
                decoration: InputDecoration(
                  labelText: 'Contact number',
                  icon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _altContactController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Alternate Contact number',
                  icon: Icon(Icons.contact_phone_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedValue,
                decoration: InputDecoration(
                  labelText: 'Event Type',
                  icon: Icon(Icons.event),
                  border: OutlineInputBorder(),
                ),
                items: events.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
              ),
              GestureDetector(
                onTap: () async {
                  await _selectDate(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _eventDateController,
                    decoration: InputDecoration(
                      labelText: 'Event Date',
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      !RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid Email!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Enquiry Message',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.message),
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  var Name = _textNameController.text;
                  var enq_Contact = _contactController.text;
                  var alt_Contact = _altContactController.text;
                  var Event_date = _eventDateController.text;
                  var Email = _emailController.text;
                  var enq_message = _messageController.text;

                  // EnquiryRequest temp = EnquiryRequest(
                  //   Name,
                  //   enq_Contact,
                  //   alt_Contact,
                  //   Event_date,
                  //   Email,
                  //   enq_message,
                  // );
                  //
                  // UserAPIService service = UserAPIService();
                  // service.userEnquiry(temp).then((result) {
                  //   print("Result is: ${result.status}");
                  //   if (result.status == true) {
                  //     _navigateToAdminPanel();
                  //   } else {
                  //     print("Failed to send enquiry");
                  //   }
                  // });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffF5591F), Color(0xffF2861E)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE),
                      ),
                    ],
                  ),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
