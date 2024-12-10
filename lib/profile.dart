import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:medicalprojectflutter/faq.dart';
import 'package:medicalprojectflutter/ip.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  late String completedDoses = "";
  String parentname = '';
  late XFile? selectedImageFile;
  String base64Image = '';
  Uint8List? _profileImage;
  late String _doseInfo = "";

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData1();
    fetchprofileImage(userid);
  }

  Future<Uint8List?> fetchprofileImage(String username) async {
    try {
      var response = await http.post(
        Uri.parse(ipfordp),
        body: {'username': username},
      );
      if (response.statusCode == 200) {
        setState(() {
          _profileImage = response.bodyBytes;
        });
        return response.bodyBytes;
      } else {
        print('Failed to load profile image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile image: $e');
    }
    return null;
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImageFile = pickedImage;
        sendDataToServer();
      });
    }
  }

  Future<void> sendDataToServer() async {
    if (selectedImageFile != null) {
      try {
        final bytes = await selectedImageFile!.readAsBytes();
        final base64Image = base64Encode(bytes);
        final jsonParams = jsonEncode({
          "username": userid,
          "base64image": base64Image,
        });
        final response = await http.post(
          Uri.parse(ipforupload),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonParams,
        );
        if (response.statusCode == 200) {
          fetchprofileImage(userid);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('profile Picture Updated')),
          );
          Navigator.pushReplacementNamed(context, '/profile', arguments: {
            'username': userid,
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed To Update profile Picture')),
          );
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image first')),
      );
    }
  }

  void fetchData() async {
    var response =
        await http.post(Uri.parse(ipforprofile), body: {'username': userid});

    List<String> values = response.body.split(", ");

    setState(() {
      parentname = values[0].substring(1, values[0].length);
    });
  }

  void fetchData1() async {
    try {
      var apiUrl = Uri.parse(ipforcalculatecompleteddose);
      var response = await http.post(apiUrl, body: {'username': userid});
      var jsonResponse = json.decode(response.body);
      var totalCompletedCount = jsonResponse['total_completed_count'];

     setState(() {
      completedDoses = "$totalCompletedCount/12";
    });

    if (totalCompletedCount == 0) {
      String url = ipforweek6completed;
      String k = "Week 6 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 1) {
      String url = ipforweek10completed;
      String k = "Week 10 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 2) {
      String url = ipforweek14completed;
      String k = "Week 14 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 3) {
      String url = ipformonth6completed;
      String k = "Month 6 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 4) {
      String url = ipformonth9completed;
      String k = "Month 9 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 5) {
      String url = ipforyear1completed;
      String k = "Year 1 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 6) {
      String url = ipformonth15completed;
      String k = "Month 15 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 7) {
      String url = ipformonth18completed;
      String k = "Month 18 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 8) {
      String url = ipforyear2completed;
      String k = "Year 2 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 9) {
      String url = ipforyear3completed;
      String k = "Year 3 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 10) {
      String url = ipforyear4completed;
      String k = "Year 4 Dose";
      fetchCom2(userid, url, k);
    } else if (totalCompletedCount == 11) {
      String url = ipforyear5completed;
      String k = "Year 5 Dose";
      fetchCom2(userid, url, k);
    } else {
      setState(() {
        _doseInfo = "All Doses Completed";
      });
    }
  } catch (e) {
    print("Error: $e");
  }
}

  Future<void> fetchCom2(String username, String url, String k) async {
    try {
      var response = await http.post(Uri.parse(url), body: {'username': username});
      if (response.statusCode == 200) {
        handleResponses1(response.body, k);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('HTTP Error: ${response.statusCode}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  void handleResponses1(String response, String k) {
    List<String> values = response.split(", ");

    DateTime currentDate = DateTime.now();
    DateTime parsedDate = parseDate(values[0].substring(1, values[0].length));

    DateTime futureDate = parsedDate.add(Duration(days: 90));
    String formattedDat = "${futureDate.year}-${futureDate.month}-${futureDate.day}";
    setState(() {
      _doseInfo = "$k is on $formattedDat";
    });
  }

  DateTime parseDate(String dateString) {
    List<String> possibleFormats = [
      "yyyy-MM-dd", // Standard ISO format
      "yyyy-M-d", // No leading zeros for month and day
      "MM-d", // Month and day without year
      "M-d", // Single-digit month and day without year
      "MM-dd", // Month and day with leading zeros
      "M-dd" // Single-digit month with leading zero in day
    ];

    for (String format in possibleFormats) {
      try {
        return DateFormat(format).parse(dateString);
      } catch (ignored) {}
    }
    throw ArgumentError("Unable to parse the date: $dateString");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              return Future<void>.value();
            },
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: false,
              title: Text(parentname),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  _profileImage != null && _profileImage!.isNotEmpty
                      ? Image.memory(
                          _profileImage!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/articleimage.jpg',
                          fit: BoxFit.cover,
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        openGallery();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 55,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => faq()));
                },
                child: Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          'FAQ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 225),
                        Image.asset(
                          'assets/images/arrowschdle.png',
                          width: 30,
                          height: 20,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 55,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doses Completed:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5),
                            Text(
                              completedDoses,
                              style: TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 120),
                        Image.asset(
                          'assets/images/vaccinated.png',
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 55,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Next Dose:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _doseInfo,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

