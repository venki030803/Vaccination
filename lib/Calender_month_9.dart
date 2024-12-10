import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/ip.dart';

class Calender_month9 extends StatefulWidget {
  final String username;

  Calender_month9({Key? key, required this.username}) : super(key: key);

  @override
  _Calender_month9State createState() => _Calender_month9State();
}

class _Calender_month9State extends State<Calender_month9> {
  late String mdate;
  late DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: CalendarDatePicker(
          onDateChanged: (date) {
            setState(() {
              selectedDate = date;
              mdate = "${date.year}-${date.month}-${date.day}";
            });
            sendLoginRequest(widget.username, mdate);
          },
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
        ),
      ),
    );
  }

  Future<void> sendLoginRequest(String username, String date) async {
    final url = ipformonth9completed_date;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'username': username, 'completed_date': date});

      if (response.statusCode == 200) {
        handleResponse(response.body, username);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      handleError(error.toString());
    }
  }

  void handleResponse(String response, String username) {
    print('JSON Response: $response');

    if (response.toLowerCase().contains('success')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign Up successful'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SchedulePage(username: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign Up failed'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void handleError(String error) {
    if (error.contains('SocketException')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Request timed out. Check your internet connection.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

class SchedulePage extends StatelessWidget {
  final String username;

  SchedulePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: Center(
        child: Text('Welcome, $username!'),
      ),
    );
  }
}
