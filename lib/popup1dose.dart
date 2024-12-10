import 'package:flutter/material.dart';

class Popup1Dose extends StatefulWidget {
  final String dueDate;
  final int daysLeft;

  Popup1Dose({required this.dueDate, required this.daysLeft});

  @override
  State<Popup1Dose> createState() => _Popup1DoseState();
}

class _Popup1DoseState extends State<Popup1Dose> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 50.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your due date is',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.dueDate,
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Still',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.daysLeft.toString(),
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'days more',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
