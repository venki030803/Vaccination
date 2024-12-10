import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/doctorschedule.dart';
import 'dart:convert';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/questionarieschedule.dart';

class PatientLoginActivity extends StatefulWidget {
  final String userid;
  final String parentname;
  final String dp;

  PatientLoginActivity({
    required this.userid,
    required this.parentname,
    required this.dp,
  });

  @override
  _PatientLoginActivityState createState() => _PatientLoginActivityState();
}

class _PatientLoginActivityState extends State<PatientLoginActivity> {
  late String completedDoses = ""; // To store completed doses count

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
      var apiUrl = Uri.parse(ipforcalculatecompleteddose);

      // Send POST request with username parameter
      var response = await http.post(apiUrl, body: {'username': widget.userid});

      // Parse response JSON
      var jsonResponse = json.decode(response.body);

      // Extract completed doses count from JSON
      var totalCompletedCount = jsonResponse['total_completed_count'];

      // Update completedDoses variable and rebuild the UI
      setState(() {
        completedDoses = "$totalCompletedCount/12";
      });
    } catch (e) {
      // Handle errors
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
        backgroundColor: Color(0xFF76D1FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Text(
              "Activity",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "http://$ip/vaccination/${widget.dp}",
                          ),
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.parentname,
                            style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            maxLines: 4, // Allow up to 2 lines
                            overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to DosesActivity when 'Doses' is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => doctorschedule(username:widget.userid)),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Doses",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Bold',
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Image.asset(
                                  "assets/images/vaccinedose.png",
                                  height: 60,
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Doses Completed",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins-Bold',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              // Display completed doses count here
                              Text(
                                completedDoses, // Dynamically updated completed doses count
                                style: TextStyle(
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Image.asset(
                                "assets/images/vaccinated.png",
                                height: 60,
                                width: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  
                  GestureDetector(
                    onTap: () {
                      print(widget.userid);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => questionariesschedule(username:widget.userid)),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Questionaires",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Bold',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/images/quesans.png",
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
