import 'package:flutter/material.dart';

class CalenderPopup extends StatefulWidget {
  final String days;
  const CalenderPopup({super.key, required this.days});
  @override
  State<CalenderPopup> createState() => _CalenderPopupState();
}

class _CalenderPopupState extends State<CalenderPopup> {
  
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
              'Dose available after',
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  widget.days, // Placeholder for days count
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '  days',
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
