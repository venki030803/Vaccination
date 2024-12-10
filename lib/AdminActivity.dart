import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/AddDoctorRegister.dart';
import 'package:medicalprojectflutter/homeregister.dart';
import 'package:medicalprojectflutter/mychild.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminActivity extends StatefulWidget {
  const AdminActivity({Key? key}) : super(key: key);

  @override
  _AdminActivityState createState() => _AdminActivityState();
}

class _AdminActivityState extends State<AdminActivity> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'poppins_bold',
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF76D1FF),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterDoctorPage()));
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(0, 3.54),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/child.png', height: 60, width: 60),
                        Text(
                          "ADD DOCTOR",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch URL
  _launchURL(String url1) async {
    final Uri url = Uri.parse(url1);
    if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
    }
  }
}
