import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskrootallyai/assessmentsdetailscreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Jane',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF255FD5),
          ),
        ),
        actions: [Icon(Icons.person)],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'My Assessments'),
            Tab(text: 'My Appointments'),
          ],
          labelStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF255FD5),
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B)),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyAssessmentsTab(),
          MyAppointmentsTab(),
        ],
      ),
    );
  }
}

class MyAssessmentsTab extends StatefulWidget {
  @override
  State<MyAssessmentsTab> createState() => _MyAssessmentsTabState();
}

class _MyAssessmentsTabState extends State<MyAssessmentsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 50, 30, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.all(1),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('assessments')
                    .snapshots(),
                builder: (context, assessmentsSnapshot) {
                  if (assessmentsSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final assessmentsDocs = assessmentsSnapshot.data!.docs;
                    return Hero(
                      tag: 'id-123',

                      child: ListView.builder(
                          // padding: EdgeInsets.all(21.0),
                          shrinkWrap: true,
                          itemCount: assessmentsDocs.length,
                          itemBuilder: (context, index) {
                            var imageUrl = assessmentsDocs[index]['images'];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 0.0,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Assessmentsdetailscreen(),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      imageUrl,
                                      height: 100,
                                      width: 130,

                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          assessmentsDocs[index]['title'],
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Color(0xFF222E58),
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          assessmentsDocs[index]['description'],
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/ant-design_play-circle-filled.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("Start",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Color(0xFF222E58),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF232F58),
                    minimumSize: Size(90, 22)), // Background color

                onPressed: () {},
                child: Text(
                  "View all",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )),
            ChallengesSection(),
            SizedBox(
              height: 30,
            ),
            WorkoutRoutinesSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppointmentsTab extends StatefulWidget {
  @override
  State<MyAppointmentsTab> createState() => _MyAppointmentsTabState();
}

class _MyAppointmentsTabState extends State<MyAppointmentsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //

          Row(
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Expanded(
                child: Container(
                  // width: 130,
                  height: 120,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Group 1171274978 (2).png'),
                      Text("Cancer 2nd Opinion")
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle, // Default shape is rectangle
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFC6D9FF), // Rounded corners (optional)
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  // width: 130,
                  height: 120,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Group 1171274978 (1).png'),
                      Text("      Physiotherapy "),
                      Text("    Appointment")
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle, // Default shape is rectangle
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE9C6FF), // Rounded corners (optional)
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  // width: 180,
                   height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Group 1171274978.png'),
                      Text("Fitness Appointment")
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle, // Default shape is rectangle
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFD4C6), // Rounded corners (optional)
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  // width: 180,
                   height: 120,

                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF232F58),
                      minimumSize: Size(90, 22)), // Background color

                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          ChallengesSection(),

          WorkoutRoutinesSection(),
        ]),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const AppointmentCard({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class ChallengesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text("Challenges",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          Spacer(),
          Text(
            "view all",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 3,
          ),
          Icon(Icons.arrow_circle_right_rounded)
        ],
      ),
      SizedBox(height: 8),
      Container(
        // margin: EdgeInsets.all(1),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('challenges').snapshots(),
          builder: (context, challengesSnapshot) {
            if (challengesSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final challengesDocs = challengesSnapshot.data!.docs;
              return ListView.builder(
                  //  padding: EdgeInsets.all(2.0),
                  shrinkWrap: true,
                  itemCount: challengesDocs.length,
                  itemBuilder: (context, index) {
                    return Container(
                        //   height: 1,
                        // width: 500,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Today’s Challenge!",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Color(0xFF2B7A71)),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF2B7A71),
                                          minimumSize:
                                              Size(84, 20)), // Background color

                                      onPressed: () {},
                                      child: Text(
                                        challengesDocs[index]['title'],
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      )),
                                  Text("10/20 Complete"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(
                                    'assets/images/Group 1171274948.png',
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/ant-design_play-circle-filled (1).png",
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Continue  ",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Solid color background
                                      shape: BoxShape
                                          .rectangle, // Default shape is rectangle
                                      borderRadius: BorderRadius.circular(
                                          20), // Rounded corners (optional)
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child:
                                  Image.asset("assets/images/image 53 (1).png"),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFC1EAD1), // Background color
                          borderRadius: BorderRadius.circular(20),
                        ));
                  });
            }
          },
        ),
      ),
    ]);
  }
}

class WorkoutRoutinesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text("Workout Routines",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          Spacer(),
          Text(
            "view all",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 3,
          ),
          Icon(Icons.arrow_circle_right_rounded),
        ],
      ),
      Container(
        // margin: EdgeInsets.all(1),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('workoutroutines')
              .snapshots(),
          builder: (context, workoutroutinesSnapshot) {
            if (workoutroutinesSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final workoutroutinesDocs = workoutroutinesSnapshot.data!.docs;
              return ListView.builder(
                  //  padding: EdgeInsets.all(2.0),
                  shrinkWrap: true,
                  itemCount: workoutroutinesDocs.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7D8B0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset("assets/images/sd 1.png")),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Text(
                                  workoutroutinesDocs[index]['title'],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Full body",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    workoutroutinesDocs[index]['weight'],
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFF222E58),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  style: ButtonStyle(
                                      shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black),
                                  ))),
                                ),
                                Row(
                                  children: [
                                    Text("Diffculty :",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        workoutroutinesDocs[index]['diffculty'],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFFF88A5),
                                            fontSize: 13))
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            // Background color
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 0.5, color: Colors.black)));
                  });
            }
          },
        ),
      ),
    ]);
  }
}
