import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:medicalprojectflutter/Calender_year_4.dart';
import 'package:medicalprojectflutter/calenderpopup.dart';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/popup1dose.dart';
import 'package:medicalprojectflutter/popup2dose.dart';

class year4dose extends StatefulWidget {
  @override
  State<year4dose> createState() => _year4doseState();
}

class _year4doseState extends State<year4dose> {
  List<int> array = [0,0];
  final String apiUrl = ipforyear4doseshow;

  @override
  void initState() {
    super.initState();
    fetchData(userid);
  }

  void fetchData(String username) async {
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
    print(response+"venki");
    String cleanInput = response;
    setState(() {
      array = [int.parse(cleanInput)];
      print(array);
    });
  }

  void handleError(String error) {
    print(error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Year 4 Dose'),
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
                        buildListItem('Influenza', array[0], showImage: false),
                        buildListItem('Vaccine', array[0]),
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
                    // Fetch today's data
                    fetchTodayData(userid);
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
                    // Fetch due date data
                    fetchDueDateData(userid);
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
                  // Logic for the next button
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

  Widget buildListItem(String text, int isChecked, {bool showImage = true}) {
    int? intValue = isChecked;
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
          if (showImage)
            GestureDetector(
              onTap: () {
                print(isChecked);
              },
              child: Image.asset(
                intValue == 1 ? 'assets/images/tickimg.png' : 'assets/images/cross.png',
                width: 20,
                height: 20,
              ),
            ),
        ],
      ),
    );
  }

  void fetchTodayData(String username) async {
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

  void fetchDueDateData(String username) async {
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
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(values[0].substring(1, values[0].length));

      DateTime futureDate = parsedDate.add(Duration(days: 42));
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
          MaterialPageRoute(builder: (context) => Calender_year_4(username: userid)),
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

      DateTime futureDate = parsedDate.add(Duration(days: 42));
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
