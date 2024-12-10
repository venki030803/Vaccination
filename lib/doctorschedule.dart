import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/docmonth18dose.dart';
import 'package:medicalprojectflutter/docmonth6dose.dart';
import 'package:medicalprojectflutter/docweek6dose.dart';
import 'package:medicalprojectflutter/docweek10dose.dart';
import 'package:medicalprojectflutter/docweek14dose.dart';
import 'package:medicalprojectflutter/docmonth15dose.dart';
import 'package:medicalprojectflutter/docyear2dose.dart';
import 'package:medicalprojectflutter/docyear3dose.dart';
import 'package:medicalprojectflutter/docyear4dose.dart';
import 'package:medicalprojectflutter/docyear5dose.dart';
import 'package:medicalprojectflutter/month18dose.dart';
import 'package:medicalprojectflutter/docmonth6dose.dart';
import 'package:medicalprojectflutter/docmonth9dose.dart';
import 'package:medicalprojectflutter/docyear1dose.dart';
import 'package:medicalprojectflutter/year2dose.dart';
import 'package:medicalprojectflutter/year3dose.dart';
import 'package:medicalprojectflutter/year4dose.dart';
import 'package:medicalprojectflutter/year5dose.dart';
class doctorschedule extends StatefulWidget {
   final String username;
  const doctorschedule({required this.username});

  @override
  _doctorscheduleState createState() => _doctorscheduleState();
}

class _doctorscheduleState extends State<doctorschedule> {
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
              MaterialPageRoute(builder: (context) =>docweek6dose(username: username)),
            );
          }else if (text == 'WEEK 10') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docweek10dose(username:username)),
          );
        }else if (text == 'WEEK 14') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docweek14dose(username:username)),
          );
        }else if (text == '6 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth6dose(username:username)),
          );
        }else if (text == '9 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth9dose(username:username)),
          );
        }else if (text == '1 YEAR') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear1dose(username:username)),
          );
        }else if (text == '15 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth15dose(username:username)),
          );
        }else if (text == '18 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docmonth18dose(username: username,)),
          );
        }else if (text == '2 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear2dose(username:username)),
          );
        }else if (text == '3 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear3dose(username:username)),
          );
        }else if (text == '4 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear4dose(username:username)),
          );
        }else if (text == '5 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => docyear5dose(username:username)),
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