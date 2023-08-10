import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:od_kec/connect.dart';
import 'package:od_kec/connecting.dart';
import 'package:od_kec/tab2.dart';


class LP extends StatefulWidget {
  const LP({Key? key}) : super(key: key);

  @override
  State<LP> createState() => _LPPState();
}

class _LPPState extends State<LP> with TickerProviderStateMixin{

  static Color kPrimaryColor = Color(0xff7C7B9B);
  static Color kPrimaryColorVariant = Color(0xff686795);
  late TabController tabController;

  int currentTabIndex = 0;
  int i=0;
  MongoDatabasee obj = new MongoDatabasee();
  void onTabChange() {
    setState(() {
      currentTabIndex = tabController.index;

    });
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(() {
      onTabChange();
    });
    super.initState();
  }
  @override
  int _control=0;
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.email!.toString();
    var substr=user?.substring(user.length-15,user.length-10).toString();


    return Container(margin: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.black),
      child: Scaffold(
        backgroundColor: Colors.black,
        body:Column(
          children: [
            MyTabBar(tabController: tabController),

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [

                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection(substr!.toUpperCase()).doc(user).collection("leave").where("level" ,isEqualTo: 2).snapshots(),


                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        if(snapshot.hasData) {
                          List<DocumentSnapshot>nn=snapshot.data.docs;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: nn.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                height: 200,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Leave Type: ${nn[index]["type"]}",
                                          style: GoogleFonts.aclonica(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,),),
                                      ),
                                      Icon(Icons.circle,
                                        color: Colors.lightGreenAccent,)
                                    ],
                                  ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.timelapse_outlined,
                                            color: Colors.white,),
                                          SizedBox(width: 10,),
                                          Text("From: ${nn[index]["from"]}", style: TextStyle(
                                              color: Colors.white)),
                                          SizedBox(width: 10,),
                                          Text("To: ${nn[index]["to"]}",
                                            style: TextStyle(
                                                color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0),
                                      child: Text("Reason: ${nn[index]["reason"]}",style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection(substr!.toUpperCase()).doc(user).collection("leave").where("level" ,isEqualTo: 1).snapshots(),

                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        if(snapshot.hasData) {
                          List<DocumentSnapshot>nn=snapshot.data.docs;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: nn.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                height: 200,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Leave Type: ${nn[index]["type"]}",
                                          style: GoogleFonts.aclonica(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,),),
                                      ),
                                      Icon(Icons.circle,
                                        color: Colors.lightGreenAccent,)
                                    ],
                                  ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.timelapse_outlined,
                                            color: Colors.white,),
                                          SizedBox(width: 10,),
                                          Text("From: ${nn[index]["from"]}", style: TextStyle(
                                              color: Colors.white)),
                                          SizedBox(width: 10,),
                                          Text("To: ${nn[index]["to"]}",
                                            style: TextStyle(
                                                color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0),
                                      child: Text("Reason: ${nn[index]["reason"]}",style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection(substr!.toUpperCase()).doc(user).collection("leave").where("level" ,isEqualTo: 0).snapshots(),


                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        if(snapshot.hasData) {
                          List<DocumentSnapshot>nn=snapshot.data.docs;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: nn.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                height: 200,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  children: [Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Leave Type: ${nn[index]["type"]}",
                                          style: GoogleFonts.aclonica(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,),),
                                      ),
                                      Icon(Icons.circle,
                                        color: Colors.lightGreenAccent,)
                                    ],
                                  ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.timelapse_outlined,
                                            color: Colors.white,),
                                          SizedBox(width: 10,),
                                          Text("From: ${nn[index]["from"]}", style: TextStyle(
                                              color: Colors.white)),
                                          SizedBox(width: 10,),
                                          Text("To: ${nn[index]["to"]}",
                                            style: TextStyle(
                                                color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0),
                                      child: Text("Reason: ${nn[index]["reason"]}",style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),

                ],
              ),
            ),

          ],
        ),


      ),
    );
  }
}