import 'package:flutter/material.dart';

class Popup2Dose extends StatefulWidget {
  @override
  State<Popup2Dose> createState() => _Popup2DoseState();
}

class _Popup2DoseState extends State<Popup2Dose> {
  
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
              "You've vaccinated, check for next dose",
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
