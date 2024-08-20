import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Assessmentsdetailscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  Color(0xFF91B655),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

             width: double.infinity,
              height: 300,
              decoration: BoxDecoration(


              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),
                      Text(
                        "Health Risk\nAssessment",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16),
                          SizedBox(width: 4),
                          Text("4 min"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),

                  Hero(
                      tag: 'id-123',
                    child: Image.asset(
                      'assets/images/image 216 (1).png',
                      // You can add width, height, or any other properties you need here
                    ),
                  ),
                ],
              ),
        ),





            Container(
              decoration: BoxDecoration(
                  color: Colors.white, // Change the color as needed
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
              ),
             // padding: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What do you get?",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF222E58),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Column(
                        children: [
                          Image.asset("assets/images/Vector (2).png"),
                          SizedBox(height: 10,),
                          Text(
                            "Key Body\n Vitals",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/human.png"),
                          SizedBox(height: 10,),
                          Text(
                            "Posture\n Analysis",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/humanelement.png"),
                          SizedBox(height: 10,),
                          Text("Body\n Composition",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/images/aaaaa.png"),
                          SizedBox(height: 10,),
                          Text(
                            "Instant\n Reports",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24,
              child: Container(
                color: Colors.white,
              ),
            ),

            // How do we do it? Section
            Container(
         color: Colors.white,

              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How we do it?",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222E58),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      'assets/images/Untitled-1 3.png',
                      // Replace with your image path
                    //  width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 16),

                  Container(

                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.security, color: Colors.green),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "We do not store or share your personal data",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "1. Ensure that you are in a well-lit space\n"
                    "2. Allow camera access and place your device against a stable object or wall\n"
                    "3. Avoid wearing baggy clothes\n"
                    "4. Make sure you exercise as per the instruction provided by the trainer",
                  ),
                ],
              ),
            ),
          ])
        ),

    );
  }
}
