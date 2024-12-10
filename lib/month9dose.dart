import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // For date formatting
import 'package:medicalprojectflutter/Calender.dart';
import 'package:medicalprojectflutter/Calender_month_9.dart';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/month9qa1.dart';
import 'calenderpopup.dart';
import 'popup1dose.dart';
import 'popup2dose.dart';

class month9dose extends StatefulWidget {
 

  @override
  State<month9dose> createState() => _month9doseState();
}

class _month9doseState extends State<month9dose> {
  List<int> array = [0, 0, 0, 0, 0]; 

  @override
  void initState() {
    super.initState();
    fetchData(userid);
  }

  void fetchData(String username) async {
    String apiUrl = ipformonth9doseshow;
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'username': username});
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
    
    String cleanInput = response;
    setState(() {
      array = [int.parse(cleanInput)];
    });
  }

  void handleError(String error) {
    print(error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Month 9 Dose'),
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
                        if (array.length > 0) buildListItem('MMR - Dose 1', array[0]),
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
                    MaterialPageRoute(builder: (context) => month9qa1(userid)),
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
    String apiUrl = ipformonth9completed;
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'username': username});
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
    String apiUrl = ipformonth9completed;
    try {
      var response = await http.post(Uri.parse(apiUrl), body: {'username': username});
      if (response.statusCode == 200) {
        handleResponses1(response.body);
      } else {
        handleError('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      handleError(error.toString());
    }
  }

  void handleResponses(String response, String username) {
    List<String> values = response.split(", ");
    if (values[1].substring(0, values[1].length - 1) == "0") {
      DateTime currentDate = DateTime.now();
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(values[0].substring(1, values[0].length));

      DateTime futureDate = parsedDate.add(Duration(days: 90));
      int days = futureDate.difference(currentDate).inDays;

      if (days > 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CalenderPopup(days: days.toString());
          },
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calender_month9(username: username)),
        );
      }
    } else {
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
      DateTime currentDate = DateTime.now();
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(values[0].substring(1, values[0].length));

      DateTime futureDate = parsedDate.add(Duration(days: 90));
      int days = futureDate.difference(currentDate).inDays;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Popup1Dose(dueDate: DateFormat('yyyy-MM-dd').format(futureDate), daysLeft: days);
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Popup2Dose();
        },
      );
    }
  }
}
