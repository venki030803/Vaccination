import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; 
import 'package:medicalprojectflutter/Calender.dart';
import 'package:medicalprojectflutter/Calender_month_6.dart';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/month6qa1.dart';
import 'calenderpopup.dart';
import 'popup1dose.dart';
import 'popup2dose.dart';

class month6dose extends StatefulWidget {
  @override
  State<month6dose> createState() => _month6doseState();
}

class _month6doseState extends State<month6dose> {
  List<int> array = [0, 0, 0, 0, 0]; 
  

  void fetchData(String username) async {
    String apiUrl = ipformonth6doseshow;
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'username': userid});
      if (response.statusCode == 200) {
        handleResponse(response.body);
      } else {
        handleError('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      handleError(error.toString());
    }
  }

  void handleResponse(String response) {
    String cleanInput = response.substring(1, response.length - 1);
    setState(() {
      array = cleanInput.split(',').map((e) => int.parse(e.trim())).toList();
    });
  }

  void handleError(String error) {
    print(error);
  }

  @override
  void initState() {
    super.initState();
    fetchData(userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Month 6 Dose'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Container(
              width: 313,
              height: 326,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        if (array.length > 0) buildListItem('Influenza - Dose 1', array[0]),
                        if (array.length > 1)buildListItem('6-9 Months', array[1]),
                        if (array.length > 2)buildListItem('Typhoid TCV', array[2]),
                        if (array.length > 3)buildListItem('7 Months', array[3]),
                        if (array.length > 4)buildListItem('Influenza - Dose 2', array[4]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Given Vaccine On:',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    fetchcom1(userid);
                  },
                  child: Container(
                    width: 129,
                    height: 30,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF03A9F4),
                    ),
                    child: Center(
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    fetchcom2(userid);
                  },
                  child: Container(
                    width: 129,
                    height: 30,
                    margin: EdgeInsets.only(left: 25),
                    decoration: BoxDecoration(
                      color: Color(0xFF03A9F4),
                    ),
                    child: Center(
                      child: Text(
                        'Due Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => month6qa1(userid)),
                  );
                },
                child: Image.asset(
                  'assets/images/nextbutton.png',
                  width: 45,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(String text, int isChecked) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Expanded(child: SizedBox()),
          Image.asset(
            isChecked == 1 ? 'assets/images/tickimg.png' : 'assets/images/cross.png',
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }

  void fetchcom1(String username) async {
    String apiUrl = ipformonth6completed;
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'username': userid});
      if (response.statusCode == 200) {
        handleResponses(response.body, username);
      } else {
        handleError('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      handleError(error.toString());
    }
  }

  void fetchcom2(String username) async {
    String apiUrl = ipformonth6completed;
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'username': userid});
      if (response.statusCode == 200) {
        handleResponses1(response.body);
      } else {
        handleError('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      handleError(error.toString());
    }
  }

  void handleResponses(String response, String userid) {
    List<String> values = response.split(", ");
    print(values);
    print(values[1].substring(0, values[1].length - 1));
    if (values[1].substring(0, values[1].length - 1) == "0") {
      DateTime currentDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(values[0].substring(1, values[0].length));
      DateTime futureDate = parsedDate.add(Duration(days: 112));
      String formattedFutureDate = DateFormat('yyyy-MM-dd').format(futureDate);
      
      int days = futureDate.difference(currentDate).inDays;
      if (days > 0) {
        print('hi');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CalenderPopup(days: days.toString());
          },
        );
      } else {
        print('hi1');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calender_month6(username: userid)),
        );
      }
    } else {
      print('hi2');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Popup2Dose();
        },
      );
    }
  }

  void handleResponses1(String response) {
    List<String> values = response.split(", ");
    if (values[1].substring(0, values[1].length - 1) == "0") {
      print("hi");
      DateTime currentDate = DateTime.now();
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(values[0].substring(1, values[0].length));

      
      DateTime futureDate = parsedDate.add(Duration(days: 112));

      // Calculate days difference
      int days = futureDate.difference(currentDate).inDays;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Popup1Dose(dueDate: DateFormat('yyyy-MM-dd').format(futureDate), daysLeft: days);
        },
      );
    } else {
      print("hi1");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Popup2Dose();
        },
      );
    }
  }

  Future<void> sendDataToServer(List<int> array, String userid) async {
    try {
      String apiUrl = ipformonth6dose;
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'array': array.toString(),
          'username': userid,
        },
      );
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }
}
