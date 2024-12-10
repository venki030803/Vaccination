import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/patientlogin.dart';

class Patient {
  final String username;
  final String parentName;
  final String dp;
  Patient(this.parentName, this.username, this.dp);
}

class MyWidget extends StatelessWidget {
  final String parentName;
  final String username;
  final String dp;

  MyWidget({required this.parentName, required this.username, required this.dp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 90,
      margin: EdgeInsets.only(left:30,top: 5,right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Image.network(
              "http://"+ip+"/vaccination/${dp}",
              width: 60,
              height: 60,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                parentName,
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientLoginActivity(
                          userid: username,
                          parentname: parentName,
                          dp: dp,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4ACAD2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'See Details',
                    style: TextStyle(
                      fontFamily: 'sans-serif-medium',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TotaldoctorActivity extends StatefulWidget {
  @override
  _TotaldoctorActivityState createState() => _TotaldoctorActivityState();
}

class _TotaldoctorActivityState extends State<TotaldoctorActivity> {
  List<Patient> patientList = [];
  List<Patient> filteredList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String url = ipfortotaldoctor;
    makeRequest(url);
  }

  Future<void> makeRequest(String url) async {
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        parseResponse(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading patient data'),
        ),
      );
    }
  }

  void parseResponse(String responseBody) {
    List<dynamic> data = json.decode(responseBody);
    List<Patient> tempPatientList = [];
    for (var item in data) {
      tempPatientList.add(Patient(item['parentname'], item['username'], item['dp']));
    }
    setState(() {
      patientList = tempPatientList;
      filteredList = patientList;
    });
  }

  void filterPatientList(String searchText) {
    List<Patient> tempFilteredList = [];
    searchText = searchText.toLowerCase().trim();
    if (searchText.isEmpty) {
      tempFilteredList = patientList;
    } else {
      for (var patient in patientList) {
        if (patient.parentName.toLowerCase().contains(searchText)) {
          tempFilteredList.add(patient);
        }
      }
    }
    setState(() {
      filteredList = tempFilteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Doctor Activity'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20.0,top:20,right: 20,bottom: 20),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterPatientList(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientLoginActivity(
                          userid: filteredList[index].username,
                          parentname: filteredList[index].parentName,
                          dp: filteredList[index].dp,
                        ),
                      ),
                    );
                  },
                  child: MyWidget(
                    parentName: filteredList[index].parentName,
                    username: filteredList[index].username,
                    dp: filteredList[index].dp,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


 
