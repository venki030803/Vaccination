import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/saiproject.dart';
import 'ParentDoctorLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(  
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 106, 228, 230)),
        useMaterial3: false,
      ),
      home: Scaffold(
        body: ParentDoctorLoginScreen()
      ),
    );
  }
}