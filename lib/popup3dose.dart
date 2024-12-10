import 'package:flutter/material.dart';

class Popup3Dose extends StatefulWidget {
  @override
  State<Popup3Dose> createState() => _Popup3DoseState();
}

class _Popup3DoseState extends State<Popup3Dose> {
  
  @override
  Widget build(BuildContext context) {
    print("hello everyone");
    return Card(
      margin: EdgeInsets.only(bottom: 50.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Take the week 6 vaccine",
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
