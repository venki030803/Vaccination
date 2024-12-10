import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/ip.dart';

class docmonth6dose extends StatefulWidget {
  final String username;
  
  const docmonth6dose({Key? key, required this.username}) : super(key: key);

  @override
  State<docmonth6dose> createState() => _docmonth6doseState();
}

class _docmonth6doseState extends State<docmonth6dose> {
  int q1 = 0;
  int q2 = 0;
  int q3 = 0;
  int a = 0;
  int b = 0;
  int c = 0;

  final String url = ipformonth6dose;
  final String apiUrl = ipformonth6doseshow;

  @override
  void initState() {
    super.initState();    
    print(widget.username);
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
                        buildListItem('Influenza - Dose 1', () {
                          setState(() {
                            q1 = 1;
                          });
                        }, q1),
                        buildListItem('6-9 Months', () {
                          // Set state or logic for this item if needed
                        }, a,showImage: false),
                        buildListItem('Typhoid TCV', () {
                          setState(() {
                            q2 = 1;
                          });
                        }, q2),
                        buildListItem('7 Months', () {
                          // Set state or logic for this item if needed
                        }, b,showImage: false),
                        buildListItem('Influenza - Dose 2', () {
                          setState(() {
                            q3 = 1;
                          });
                        }, q3),
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
                    // Your onTap logic here
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
                    // Your onTap logic here
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
                  sendDataToServer();
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

  Widget buildListItem(String text, VoidCallback onTap, int isChecked,{bool showImage = true}) {
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
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          if (showImage) 
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              isChecked == 1 ? 'assets/images/tickimg.png' : 'assets/images/cross.png',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendDataToServer() async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': widget.username,
          'q1': q1.toString(),
          'q2': q2.toString(),
          'q3': q3.toString(),
        },
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
