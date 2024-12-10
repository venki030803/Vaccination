 import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/doses.dart';

class year4qa5 extends StatefulWidget {
  final String cmt;
  final String cmt1;
  final String cmt2;
  final String cmt3;
  year4qa5({Key? key, required this.cmt, required this.cmt1, required this.cmt2, required this.cmt3}) : super(key: key);
  
  @override
  _year4qa5State createState() => _year4qa5State();
}

class _year4qa5State extends State<year4qa5> {
  String cmt4 = "0"; // Default value for cmt

  void fetchData() async {
    String apiUrl = ipforyear4qa5;
    Map<String, String> data = {'username': userid};
    http.Response response = await http.post(Uri.parse(apiUrl), body: data);
    handleResponse(response.body);
  }

  void handleResponse(String response) {
    print('JSON Response: $response');
    response = response.trim();
    int a = int.parse(response[1]);
    print(a);
    if (a == 1) {
      print("aaaaa");
      setState(() {
        cmt4 = "1";
        print(cmt4);
      });
    } else {
      print("Response is NOT equal to '1'");
    }
  }

  void sendLoginRequest(String username, BuildContext context) {
    String url = ipforyear4;
    http.post(Uri.parse(url), body: {
      'username': username,
      'q1': widget.cmt,
      'q2': widget.cmt1,
      'q3': widget.cmt2,
       'q4': widget.cmt3,
      'q5': cmt4,
    }).then((response) {
      if (response.statusCode == 200) {
        handleResponse1(response.body, userid, context);
      } else {
        handleError1(response.statusCode, context);
      }
    }).catchError((error) {
      print('Error: $error');
      handleError1(-1, context);
    });
  }

  void handleResponse1(String response, String username, BuildContext context) {
    print('JSON Response: $response');

    try {
      if (response.toLowerCase().contains("success")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sign Up successful"),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => doses(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sign Up failed"),
          ),
        );
      }
    } catch (e) {
      print('Error parsing JSON: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error parsing JSON"),
        ),
      );
    }
  }

  void handleError1(int errorCode, BuildContext context) {
    String errorMessage;
    switch (errorCode) {
      case -1:
        errorMessage = "An error occurred. Please try again later.";
        break;
      default:
        errorMessage = "Request failed with error code: $errorCode";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Year 4'),
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
                        'Says poem,Able to tell A,B,C,D and 1,2,3,4 letters and simple story',
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
                                cmt4 = "1";
                              });
                              print(cmt4);
                              print('Yes button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cmt4 == "1" ? Colors.green : Colors.white,
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
                              setState(() {
                                cmt4 = "0";
                              });
                              print(cmt4);
                              print('No button pressed');
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
              ElevatedButton(
                onPressed: () {
                  sendLoginRequest(userid, context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Change color as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40,
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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