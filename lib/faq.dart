import 'package:flutter/material.dart';
class faq extends StatefulWidget {
  const faq({super.key});

  @override
  State<faq> createState() => _faqState();
}

class _faqState extends State<faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(
              'FAQ',
              style: TextStyle(
                fontFamily: 'poppins_bold',
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF76D1FF),
            ),
      body: SingleChildScrollView(
        child: Container(
          width: 354,
          height: 1650,
          margin: EdgeInsets.fromLTRB(20, 70, 29, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What should I tell my doctor before vaccination?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 0, right: 10,bottom: 35),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Any present infection, previous allergic reaction to vaccination, currently on any medication.",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Should I rub the vaccination site or not?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom:45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Any present infection, previous allergic reaction to vaccination, currently on any medication.",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Should I give paracetamol after vaccination?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Routine use not indicated, may be given to relieve discomfort, does not prevent any adverse reactions.",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "How long should I stay in hospital post vaccination?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "15 -30 mins observation.",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Should I follow diet restriction after vaccination ? ",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "No.",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "How common is anaphylaxis following vaccination? ",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Incidence : 0.65 to 1.00 / million dose",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Post BCG vaccination reaction ? ",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 65),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        " Wheal - 30 mins. Papule -2-3 weeks, Pustule at 5-6 weeks, complete healing with scar at 10 -12 weeks.(5-7 mm in size)",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "What should I do when bcg vaccination is missed? ",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        " Give within 2 weeks or give with next schedule at 6 weeks Can be given upto 5 yrs",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "What are the optional vaccines available other than in IAP schedule ?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Influenza vaccine,Varicella vaccine,Typhoid vaccine",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Upto what age bcg can be given?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "1 yr",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                
                
                SizedBox(height: 10),
                Text(
                  "OPV Upto what age can be given?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "5 yr ( OPV 0 dose – 15 days since birth)",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "DPT vaccine Upto what age can be given?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "7 years",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "JE vaccine Upto what age can be given ? ",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "15 years",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 1,
                  margin: EdgeInsets.only(left: 0, top: 10),
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                Text(
                  "Even after receiving complete vaccination should I administer the vaccine provided in campaigns?",
                  style: TextStyle(
                    fontFamily: 'poppins_semibold',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "yes",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
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
      ),
    );
  }
}