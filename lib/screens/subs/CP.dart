import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:od_kec/connect.dart';

import 'package:od_kec/tab2.dart';


class CP extends StatefulWidget {
  const CP({Key? key}) : super(key: key);

  @override
  State<CP> createState() => _CPState();
}

class _CPState extends State<CP> with TickerProviderStateMixin{

  MongoDatabasee obj = new MongoDatabasee();
  static Color kPrimaryColor = Color(0xff7C7B9B);
  static Color kPrimaryColorVariant = Color(0xff686795);
  late TabController tabController;
  int currentTabIndex = 0;

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

                  FutureBuilder(
                    future: obj.connect(1),
                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        if(snapshot.hasData) {


                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
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
                                        child: Text("Leave Type: ${snapshot.data[index]["type"]}",
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
                                          Text("From: ${snapshot.data[index]["from"]}", style: TextStyle(
                                              color: Colors.white)),
                                          SizedBox(width: 10,),
                                          Text("To: ${snapshot.data[index]["to"]}",
                                            style: TextStyle(
                                                color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0),
                                      child: Text("Reason: ${snapshot.data[index]["reason"]}",style: TextStyle(color: Colors.white),),
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
                  FutureBuilder(
                    future: obj.connect(2),
                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        if(snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
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
                                        child: Text("Leave Type: ${snapshot.data[index]["type"]}",
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
                                          Text("From: ${snapshot.data[index]["from"]}", style: TextStyle(
                                              color: Colors.white)),
                                          SizedBox(width: 10,),
                                          Text("To: ${snapshot.data[index]["to"]}",
                                            style: TextStyle(
                                                color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0),
                                      child: Text("Reason: ${snapshot.data[index]["reason"]}",style: TextStyle(color: Colors.white),),
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
                  FutureBuilder(
                    future: obj.connect(0),
                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        if(snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
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
                                        child: Text("Leave Type: ${snapshot.data[index]["type"]}",
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
                                          Text("From: ${snapshot.data[index]["from"]}", style: TextStyle(
                                              color: Colors.white)),
                                          SizedBox(width: 10,),
                                          Text("To: ${snapshot.data[index]["to"]}",
                                            style: TextStyle(
                                                color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8.0),
                                      child: Text("Reason: ${snapshot.data[index]["reason"]}",style: TextStyle(color: Colors.white),),
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