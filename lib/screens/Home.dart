
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:od_kec/connect.dart';
import 'package:od_kec/main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:realm/realm.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MongoDatabasee obj=new MongoDatabasee();



  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.email!.toString();
    var substr=user?.substring(user.length-15,user.length-10).toString();
    return Scaffold(
      body : SafeArea(
        child: Container(

          height: 5000,
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection(substr!.toUpperCase()).doc(user).snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {



                List<Widget> children;

                if (snapshot.hasError) {

                  return Text("${snapshot.error}");
                }
                else
                {

                  if(snapshot.hasData)
                  {
                    print(snapshot.data?.get("Roll No"));

                    List<DocumentSnapshot> documents=[];
                    var xx=snapshot.data?.get("ODcat");
                    Map<String, double> dataMap = {
                      "Paper": xx[0]/1,
                      "Project": xx[1]/1,
                      "Sports": xx[2]/1,
                      "WorkShop": xx[3]/1,
                      "Organizing Events": xx[4]/1,
                      "Others":xx[5]/1,
                      "not participated":xx[6]/1
                    };


                    return Scaffold(
                      body: Container(

                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 0, 0, 0),
                                  Color.fromARGB(255, 0, 0, 0)
                                ])),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,


                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            title: Text(
                              "KEC",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            // leading: Icon(
                            //   Icons.menu,
                            //   color: Colors.black,
                            // ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.notification_add_rounded,
                                  color: Color.fromARGB(255, 57, 57, 57),
                                ),
                              )
                            ],
                          ),
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.start,









                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 40),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15, top: 40),
                                        child: Text(
                                          snapshot.data?.get("name"),  style: GoogleFonts.nunitoSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 15, top: 5),
                                          child: Text(
                                           snapshot.data?.get("Roll No"),
                                            style: GoogleFonts.nunitoSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          )),
                                    ],
                                  ),
                                ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 50),
                                      child: Text(
                                        "Welcome Back !",
                                        style: GoogleFonts.nunitoSans(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30, right: 10),
                                      child: PieChart(
                                        dataMap: dataMap,


                                        colorList: colorList,
                                        chartRadius: 180,
                                        centerText: "OD",
                                        ringStrokeWidth: 20,
                                        gradientList: [[Color.fromARGB(255, 255,105,180),Color.fromARGB(255, 255,105,180)],[Color.fromARGB(255, 235,241,91),Color.fromARGB(255, 235,241,91)]
                                          ,[Color.fromARGB(255, 14, 224, 48),Color.fromARGB(255,14, 224, 48)],[Color.fromARGB(255, 0,255,255),Color.fromARGB(255,0,255,255)],[Color.fromARGB(255, 255,165,0),Color.fromARGB(255,255,165,0)],
                                          [Color.fromARGB(255, 53, 126, 238),Color.fromARGB(255,53, 126, 238)],[Color.fromARGB(
                                              255, 28, 246, 188),Color.fromARGB(255,28, 246, 188)]],

                                        animationDuration: const Duration(seconds: 3),
                                        // chartValuesOptions: const ChartValuesOptions(
                                        //     showChartValues: true,
                                        //     showChartValuesOutside: true,
                                        //     showChartValuesInPercentage: true,
                                        //     showChartValueBackground: false),
                                        legendOptions: const LegendOptions(
                                            showLegends: true,
                                            legendTextStyle:
                                            TextStyle(fontSize: 12, color: Colors.white)
                                          //     legendShape: BoxShape.rectangle,
                                          //     legendTextStyle: TextStyle(fontSize: 15),
                                          //     legendPosition: LegendPosition.bottom,
                                          //     showLegendsInRow: true),
                                          // gradientList: gradientList,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: new CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 13.0,
                                          animation: true,
                                          percent:((100-snapshot.data?.get("OD periods"))/100) ,
                                          center: new Text(
                                            "${100-snapshot.data?.get("OD periods")} periods",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Colors.white),
                                          ),
                                          footer: Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: new Text("OD Available",
                                                style: GoogleFonts.nunitoSans(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: Colors.lightGreenAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 60, top: 15),
                                        child: new CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 13.0,
                                          animation: true,
                                          percent:((20-snapshot.data?.get("leave periods"))/20),
                                          center: new Text(
                                            "${20-snapshot.data?.get("leave periods")} periods",
                                            //"sdsd",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Colors.white),
                                          ),
                                          footer: Padding(
                                            padding: const EdgeInsets.only(top: 5),
                                            child: new Text("Leave Available",
                                                style: GoogleFonts.nunitoSans(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: Colors.limeAccent,
                                        ),
                                      ),
                                    ]),
                              ],

                        ),
                      ),
                    ));

                  }

                }
                return Center(
                  child: CircularProgressIndicator(),
                );

              }
          ),
        ),
      ),
    );
  }

  //  Widget build(BuildContext context) {
  //   final user = App(AppConfiguration('application-0-wxtih',localAppName: "odkec")).currentUser;
  //   return Scaffold(
  //     body : SafeArea(
  //       child: Container(
  //
  //         height: 5000,
  //         child: FutureBuilder(
  //             future:  obj.profile(user!.profile.email!),
  //             builder: (context, AsyncSnapshot snapshot) {
  //
  //
  //
  //               if (snapshot.hasError) {
  //
  //                 return Text("${snapshot.error}");
  //               }
  //               else
  //               {
  //
  //                 if(snapshot.hasData)
  //                 {
  //
  //
  //
  //
  //
  //
  //                   return Scaffold(
  //                     backgroundColor: Colors.black,
  //                     appBar: AppBar(
  //                       backgroundColor: Colors.black,
  //                       title: Text(
  //                         "Profile",
  //                         style: GoogleFonts.poppins(
  //                             color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
  //                       ),
  //                       actions: [ElevatedButton(onPressed: ()async{await user?.logOut();
  //                       PersistentNavBarNavigator.pushNewScreen(
  //                         context,
  //
  //                         screen: MyHomePage(),
  //                         withNavBar: false,
  //                         pageTransitionAnimation: PageTransitionAnimation.fade,
  //                       );
  //                       PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context, screen: const MyHomePage(), settings: RouteSettings(name: MyHomePage.routeName));
  //                       }, child: Icon(Icons.logout,color: Colors.white,))],
  //                     ),
  //                     body: SingleChildScrollView(
  //                       child: Column(
  //                         children: <Widget>[
  //                           Container(
  //                             color: Colors.black,
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: <Widget>[
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 20),
  //                                   child: CircleAvatar(
  //                                     radius: 50,
  //                                     backgroundImage: NetworkImage(
  //                                         "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 10),
  //                                   child: Text(
  //                                     snapshot.data[0]["name"].toString().toUpperCase(),
  //                                     style: GoogleFonts.poppins(
  //                                         color: Colors.white,
  //                                         fontSize: 23,
  //                                         fontWeight: FontWeight.bold),
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 5),
  //                                   child: Text(
  //                                     snapshot.data[0]["class"],
  //                                     style: GoogleFonts.poppins(
  //                                         color: Colors.white,
  //                                         fontSize: 18,
  //                                         fontWeight: FontWeight.bold),
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(top: 10),
  //                                   child: Text(
  //                                     snapshot.data[0]["Roll No"],
  //                                     style: GoogleFonts.poppins(
  //                                       color: Colors.white,
  //                                       fontSize: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Text(
  //                                   user!.profile.email!,
  //                                   style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontSize: 18,
  //                                     letterSpacing: 2.5,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 20,
  //                                   width: 150,
  //                                   child: Divider(
  //                                     color: Colors.white,
  //                                   ),
  //                                 ),
  //                                 Card(
  //                                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
  //                                   child: ListTile(
  //                                     leading: Icon(Icons.calendar_month, color: Colors.black),
  //                                     title: Text(
  //                                       snapshot.data[0]["DOB"],
  //                                       style: GoogleFonts.poppins(
  //                                         color: Colors.black,
  //                                         fontSize: 20,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Card(
  //                                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
  //                                   child: ListTile(
  //                                     leading: Icon(Icons.phone, color: Colors.black),
  //                                     title: Text(
  //                                       "+91 ${snapshot.data[0]["phoneno"]}",
  //                                       style: GoogleFonts.poppins(
  //                                         color: Colors.black,
  //                                         fontSize: 20,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Card(
  //                                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
  //                                   child: ListTile(
  //                                     leading: Icon(
  //                                       Icons.location_on,
  //                                       color: Colors.black,
  //                                     ),
  //                                     title: Text(
  //                                       snapshot.data[0]["address"],
  //                                       style: GoogleFonts.poppins(
  //                                         color: Colors.black,
  //                                         fontSize: 20,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Card(
  //                                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
  //                                   child: ListTile(
  //                                     leading: Icon(
  //                                       Icons.bloodtype,
  //                                       color: Colors.black,
  //                                     ),
  //                                     title: Text(
  //                                       snapshot.data[0]["bgrp"],
  //                                       style: GoogleFonts.poppins(
  //                                         color: Colors.black,
  //                                         fontSize: 20,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //
  //
  //
  //                 }
  //
  //               }
  //               return Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //
  //             }
  //         ),
  //       ),
  //     ),
  //   );
  // }
}