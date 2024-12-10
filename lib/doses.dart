import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/month15dose.dart';
import 'package:medicalprojectflutter/month18dose.dart';
import 'package:medicalprojectflutter/month6dose.dart';
import 'package:medicalprojectflutter/month9dose.dart';
import 'package:medicalprojectflutter/week10dose.dart';
import 'package:medicalprojectflutter/week14dose.dart';
import 'package:medicalprojectflutter/week6dose.dart';
import 'package:medicalprojectflutter/year1dose.dart';
import 'package:medicalprojectflutter/year2dose.dart';
import 'package:medicalprojectflutter/year3dose.dart';
import 'package:medicalprojectflutter/year4dose.dart';
import 'package:medicalprojectflutter/year5dose.dart';

import 'ip.dart';
class doses extends StatefulWidget {
  
  
  @override
  _dosesState createState() => _dosesState();
}

class _dosesState extends State<doses> {
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
                      ShadowBoxTextView(text: 'WEEK 6',),
                      ShadowBoxTextView(text: 'WEEK 10',),
                      ShadowBoxTextView(text: 'WEEK 14',),
                      ShadowBoxTextView(text: '6 MONTHS',),
                      ShadowBoxTextView(text: '9 MONTHS',),
                      ShadowBoxTextView(text: '1 YEAR',),
                      ShadowBoxTextView(text: '15 MONTHS',),
                      ShadowBoxTextView(text: '18 MONTHS',),
                      ShadowBoxTextView(text: '2 YEARS',),
                      ShadowBoxTextView(text: '3 YEARS',),
                      ShadowBoxTextView(text: '4 YEARS',),
                      ShadowBoxTextView(text: '5 YEARS',),
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
  final String text;

  ShadowBoxTextView({required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hello");
        if (text == 'WEEK 6') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>week6dose()),
            );
          }else if (text == 'WEEK 10') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => week10dose()),
          );
        }else if (text == 'WEEK 14') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => week14dose()),
          );
        }else if (text == '6 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => month6dose()),
          );
        }else if (text == '9 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => month9dose()),
          );
        }else if (text == '1 YEAR') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => year1dose()),
          );
        }else if (text == '15 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => month15dose()),
          );
        }else if (text == '18 MONTHS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => month18dose()),
          );
        }else if (text == '2 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => year2dose()),
          );
        }else if (text == '3 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => year3dose()),
          );
        }else if (text == '4 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => year4dose()),
          );
        }else if (text == '5 YEARS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => year5dose()),
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