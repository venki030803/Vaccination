import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/doctorhome.dart';
import 'package:medicalprojectflutter/ip.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}
class _DoctorLoginState extends State<DoctorLogin> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        String response = await _sendLoginRequest(username, password);
        _handleResponse(response);
      } catch (e) {
        _handleError(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Fields cannot be empty'),
      ));
    }
  }

  Future<String> _sendLoginRequest(String username, String password) async {
    String url = ipfordoctorlogin;
    print(url);
    Map<String, String> data = {'username': username, 'password': password};

    var response = await http.post(Uri.parse(url), body: data);
    print(response.statusCode);

    if (response.statusCode == 200) {
      setState(() {
        userid=username;
      });
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _handleResponse(String response) {
    print('JSON Response: $response');

    try {
      if (response.toLowerCase().contains('success')) {
        print("hello");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login successful'),
        ));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  (DoctorHomePage())),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login failed'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error parsing JSON'),
      ));
    }
  }

  void _handleError(dynamic error) {
    if (error is TimeoutException) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Request timed out. Check your internet connection.'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $error'),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
              'Doctor Login',
              
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
      body:SingleChildScrollView(
        child: Container(
          width: 600,
          height: 700,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF76D1FF), Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0,3.54)
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(top:35.0,right: 20.0,left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      
                      child: TextField(
                        controller: _usernameController,
                        obscureText: false,
                        decoration: InputDecoration(
                                
                          labelText: 'UID',
                          labelStyle: TextStyle(
                            fontFamily: 'poppins_bold',
                            color: Colors.black,
                            fontSize: 15.0,
                            
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'poppins_bold',
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    //SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 20),
                  backgroundColor:  Color(0xFF76D1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'poppins_bold',
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
                    
                  ],
                    
                ),
              ),
              
      
              
            ],
          ),
        ),
      ),
    );
  }
}
