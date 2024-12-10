import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/week10qa3.dart';

class week10qa2 extends StatefulWidget {
  final String cmt; 
  // Define a field to receive cmt
  week10qa2({Key? key, required this.cmt}) : super(key: key); // Constructor

  @override
  _week10qa2State createState() => _week10qa2State();
}

class _week10qa2State extends State<week10qa2> {
  // String cmt = "0"; // No need for this as cmt is now received from week6qa1
  String cmt1="0";
  void fetchData() async {
    // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
    String apiUrl = ipforweek10qa2;

    // Create a map with the username
    Map<String, String> data = {'username': userid};

    // Send a POST request to the API endpoint
    http.Response response = await http.post(Uri.parse(apiUrl), body: data);

    // Handle the response
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
        cmt1 = "1";
        print(cmt1);
      });
    } else {
      print("Response is NOT equal to '1'");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 10'),
        backgroundColor: Color(0xFF76D1FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
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
                    'assets/images/gif123.gif', // Replace with your actual GIF asset path
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
                        'Coos,gurgles and make eye to eye contatct',
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
                                cmt1 = "1";
                              });
                              print(cmt1);
                              print('Yes button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cmt1 == "1" ? Colors.green : Colors.white,
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
                                cmt1 = "1";
                              });
                              print(cmt1);
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => week10qa3(cmt: widget.cmt,cmt1: cmt1)),
                  );
                },
                child: Image.asset(
                  'assets/images/nextbutton.png', // Replace with your next button asset
                  width: 45,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
