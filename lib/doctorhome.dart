import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Assuming these imports are correct for your project
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/patientlogin.dart';
import 'package:medicalprojectflutter/totaldoctor.dart';

class Patient {
  final String username;
  final String parentname;
  final String dp;

  Patient(this.username, this.parentname, this.dp);
}

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  List<Patient> patientList = [];

  @override
  void initState() {
    super.initState();
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    try {
      final response = await http.post(Uri.parse(ipforpatientlist));
      if (response.statusCode == 200) {
        final List<Patient> patients = parseResponse(response.body);
        setState(() {
          patientList = patients;
        });
      } else {
        print('Server returned status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load patients');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching patients'),
        ),
      );
    }
  }

  List<Patient> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Patient>((json) =>
        Patient(json['username'], json['parentname'], json['dp'])).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            margin: EdgeInsets.fromLTRB(42, 93, 44, 64),
            child: Image.asset('assets/images/doctorphoto.jpg'),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: patientList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final patient = patientList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientLoginActivity(
                          userid: patient.username,
                          parentname: patient.parentname,
                          dp: patient.dp,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         CircleAvatar(
                          backgroundImage: NetworkImage(
                            "http://$ip/vaccination/${patient.dp}",
                          ),
                          radius: 30,
                        ),
                          SizedBox(height: 8),
                          Text(
                            patient.parentname,
                            style: TextStyle(
                              fontFamily: 'poppins_semibold',
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 63,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TotaldoctorActivity()),
                  );
                },
                child: Text(
                  'See More',
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
