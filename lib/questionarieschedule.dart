import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/docmonth15qa1.dart';
import 'package:medicalprojectflutter/docmonth18qa1.dart';
import 'package:medicalprojectflutter/docmonth6qa1.dart';
import 'package:medicalprojectflutter/docmonth9qa1.dart';
import 'package:medicalprojectflutter/docyear1qa1.dart';
import 'package:medicalprojectflutter/docyear2qa1.dart';
import 'package:medicalprojectflutter/docyear3qa1.dart';
import 'package:medicalprojectflutter/docyear4qa1.dart';
import 'package:medicalprojectflutter/docyear5qa1.dart';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/docweek6qa1.dart';
import 'package:medicalprojectflutter/docweek10qa1.dart';
import 'package:medicalprojectflutter/docweek14qa1.dart';
import 'package:medicalprojectflutter/docmonth15qa1.dart';
import 'package:medicalprojectflutter/docmonth18qa1.dart';
import 'package:medicalprojectflutter/docmonth6qa1.dart';
import 'package:medicalprojectflutter/docmonth9qa1.dart';
import 'package:medicalprojectflutter/docyear1qa1.dart';
import 'package:medicalprojectflutter/docyear2qa1.dart';
import 'package:medicalprojectflutter/docyear3qa1.dart';
import 'package:medicalprojectflutter/docyear4qa1.dart';
import 'package:medicalprojectflutter/docyear5qa1.dart';
class questionariesschedule extends StatefulWidget {
  final String username;
  const questionariesschedule({required this.username});

  @override
  _questioanriesscheduleState createState() => _questioanriesscheduleState();
}

class _questioanriesscheduleState extends State<questionariesschedule> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Schedule',
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                      ],
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShadowBoxTextView(text: 'WEEK 6',username:widget.username),
                      ShadowBoxTextView(text: 'WEEK 10',username:widget.username),
                      ShadowBoxTextView(text: 'WEEK 14',username:widget.username),
                      ShadowBoxTextView(text: '6 MONTHS',username:widget.username),
                      ShadowBoxTextView(text: '9 MONTHS',username:widget.username),
                      ShadowBoxTextView(text: '1 YEAR',username:widget.username),
                      ShadowBoxTextView(text: '15 MONTHS',username:widget.username),
                      ShadowBoxTextView(text: '18 MONTHS',username:widget.username),
                      ShadowBoxTextView(text: '2 YEARS',username:widget.username),
                      ShadowBoxTextView(text: '3 YEARS',username:widget.username),
                      ShadowBoxTextView(text: '4 YEARS',username:widget.username),
                      ShadowBoxTextView(text: '5 YEARS',username:widget.username),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShadowBoxTextView extends StatelessWidget {
  final String text;final String username;
  ShadowBoxTextView({required this.text,required this.username});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hello");
        if (text == 'WEEK 6') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>docweek6qa1(username: username)),
            );
          }else if (text == 'WEEK 10') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docweek10qa1(username:username)),
          );
        }else if (text == 'WEEK 14') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docweek14qa1(username:username)),
          );
        }else if (text == '6 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth6qa1(username:username)),
          );
        }else if (text == '9 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth9qa1(username:username)),
          );
        }else if (text == '1 YEAR') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear1qa1(username:username)),
          );
        }else if (text == '15 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth15qa1(username:username)),
          );
        }else if (text == '18 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth18qa1(username:username)),
          );
        }else if (text == '2 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear2qa1(username:username)),
          );
        }else if (text == '3 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear3qa1(username:username)),
          );
        }else if (text == '4 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear4qa1(username:username)),
          );
        }else if (text == '5 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear5qa1(username:username)),
          );
        }
      },
      
      child: Container(
        height: 56,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: TextStyle(
                  
                  
                  fontSize: 20,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(right:20),
              child: Image.asset(
                'assets/images/arrowschdle.png', // Replace with actual path
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}