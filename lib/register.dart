import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:http/http.dart' as http;
import 'package:medicalprojectflutter/ParentDoctorLogin.dart';
import 'package:medicalprojectflutter/ip.dart';
import 'package:medicalprojectflutter/parentlogin.dart';
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
   TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _parentnameController = TextEditingController();
  TextEditingController _childnameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String? _selectedSex;
  String? _selectedBloodGroup;
  DateTime? _selectedDate;

void sendDataToServer() async {
  // Extract the values from the controllers
  String username = _usernameController.text;
  String password = _passwordController.text;
  String parentname = _parentnameController.text;
  String childname = _childnameController.text;
  String age = _ageController.text;
  String phone = _phoneController.text;
  String gender = _selectedSex ?? ''; // Check if _selectedSex is null
  String bloodGroup = _selectedBloodGroup ?? '';
  String dob = DateFormat('yyyy-MM-dd').format(_selectedDate!); // Format date of birth


  // Validate the data (Optional)

  // Make the HTTP request to send data to the server
  var url = Uri.parse(ipforregister);
  var response = await http.post(
    url,
    body: {
      'username': username,
      'password': password,
      'parentname': parentname,
      'childname': childname,
      'age': age,
      'phone' : phone,
      'gender': gender,
      'bloodgroup': bloodGroup,
      'dob': dob,
    },
  );

  // Check the response status and handle accordingly
  if (response.statusCode == 200) {
    // Data sent successfully, handle the response
    print('Data sent successfully');
    // Optionally, you can navigate to a new screen or show a success message
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginActivity()),
    );
  } else {
    // Failed to send data, handle the error
    print('Failed to send data. Error: ${response.reasonPhrase}');
    // Optionally, you can show an error message to the user
  }
}


Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Format date as desired
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF76D1FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParentDoctorLoginScreen()),
            );
          },
        ),
        title: Text(
          'Register',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          ),
        ),
        centerTitle: true, // Center the title horizontally
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color:Color(0xFF76D1FF),
            borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.all(20.0), // Add padding to Container
          child: Column(
            children: [
              TextWithInputField(controller: _usernameController, label: 'Username'),
              TextWithInputField(controller: _passwordController, label: 'Password', obscureText: true),
              TextWithInputField(controller: _parentnameController, label: 'Parent Name'),
              TextWithInputField(controller: _childnameController, label: 'Child Name'),
              TextWithInputField(controller: _ageController, label: 'Age'),
              TextWithInputField(controller: _phoneController, label: 'Phone'),
              ListTile(
                title: Text('Gender'),
                trailing: DropdownButton<String>(
                  value: _selectedSex,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSex = newValue;
                    });
                  },
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),
                           
           
              ListTile(
                title: Text('Blood Group'),
                trailing: DropdownButton<String>(
                  value: _selectedBloodGroup,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedBloodGroup = newValue;
                    });
                  },
                  items: <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ),
              InkWell(
              onTap: () => _selectDate(context), // Open date picker on tap
              child: IgnorePointer(
                child: TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendDataToServer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF76D1FF),
                  foregroundColor: Color.fromARGB(255, 254, 255, 255),
                  
                ),
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWithInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;

  const TextWithInputField({Key? key, required this.controller, required this.label, this.obscureText = false, this.keyboardType = TextInputType.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 7.5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}