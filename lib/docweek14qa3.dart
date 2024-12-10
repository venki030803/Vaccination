import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/docweek14qa4.dart';

class docweek14qa3 extends StatefulWidget {
  final String username;
  const docweek14qa3({super.key, required this.username});
  @override
  _docweek14qa3State createState() => _docweek14qa3State();
}

class _docweek14qa3State extends State<docweek14qa3> {
  String cmt = "0"; // Default value for cmt

  void fetchData() async {
    String apiUrl = ipforweek14qa3;

    Map<String, String> data = {'username': widget.username};
    print("hello"+widget.username+"\n"+"\n");
    http.Response response = await http.post(Uri.parse(apiUrl), body: data);

    handleResponse(response.body);
  }

  void handleResponse(String response) {
    print('JSON Response: $response');

    response = response.trim();
    print(response);
    int a = int.parse(response[1]);

    print(a);
    if (a == 1) {
      print("aaaaa");
      setState(() {
        cmt = "1";
        print(cmt);
      });
    } else {
      print("Response is NOT equal to '1'");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void sendDataToDatabase(String value) async {
    String apiUrl = ipforweek14qa2;

    Map<String, dynamic> data = {
      'username': userid,
      'q1': value, // Only send the value for q1
    };

    http.Response response = await http.post(Uri.parse(apiUrl), body: data);

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Error sending data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 14'),
        backgroundColor: Color(0xFF76D1FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/gif123.gif',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 300,
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ventral suspension - head above the plane of trunk',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                cmt = "1";
                              });
                              print(cmt);
                              print('Yes button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cmt == "1" ? Colors.green : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 40,
                              ),
                            ),
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 40,
                              ),
                            ),
                            child: Text(
                              'No',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
              GestureDetector(
                onTap: () {
                  // Send the value of 'cmt' to database
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => docweek14qa4( username: widget.username,)),
                  );
                },
                child: Image.asset(
                  'assets/images/nextbutton.png', // Replace with your next button asset
                  width: 45,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
