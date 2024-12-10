import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/AdminLogin.dart';

import 'doctorlogin.dart';
import 'parentlogin.dart';

class ParentDoctorLoginScreen extends StatefulWidget {
  @override
  _ParentDoctorLoginScreenState createState() =>
      _ParentDoctorLoginScreenState();
}

class _ParentDoctorLoginScreenState extends State<ParentDoctorLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomShape(), // Adding the custom shape
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500, // Adjusted width
                  height: 500, // Adjusted height
                  child: Image.asset(
                    'assets/images/homeimage1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomButton(
                        buttonText: "Parent",
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginActivity()),);
                        },
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        buttonText: "Doctor",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DoctorLogin()),);

                        },
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        buttonText: "Admin",
                        onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AdminLogin()),);

                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(   
      onTap: widget.onPressed,
      child: Container(
        width: 279,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.black),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShape extends StatefulWidget {
  @override
  _CustomShapeState createState() => _CustomShapeState();
}

class _CustomShapeState extends State<CustomShape> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      
      child: Container(
        height: 250, // Adjust the height based on your design
        decoration: BoxDecoration(
          color: Color(0xFF76D1FF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
