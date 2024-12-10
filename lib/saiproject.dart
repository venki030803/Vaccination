import 'package:flutter/material.dart';
import 'package:medicalprojectflutter/ip.dart';

class saiproject extends StatefulWidget {
  
  const saiproject();

  @override
  _saiprojectState createState() => _saiprojectState();
}

class _saiprojectState extends State<saiproject> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Sessions',
          style: TextStyle(
            fontFamily: 'poppins_bold',
            color: Colors.black87,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
       
        backgroundColor: Color(0xFFFFB5D7EF),
      ),
      backgroundColor: Color(0xFFFFB5D7EF),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      ShadowBoxTextView(text: 'Sessions 1'),
                      ShadowBoxTextView(text: 'Sessions 2'),
                      ShadowBoxTextView(text: 'Sessions 3'),
                      ShadowBoxTextView(text: 'Sessions 4'),
                      ShadowBoxTextView(text: 'Sessions 5'),
                      ShadowBoxTextView(text: 'Sessions 6'),
                     
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
     
      },
      
      child: Container(
        height: 56,
        width: 250,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
            
            
          ],
        ),
      ),
    );
  }
}