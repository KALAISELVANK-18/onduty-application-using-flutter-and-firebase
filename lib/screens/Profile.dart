import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:od_kec/connect.dart';
import 'package:od_kec/main.dart';
import 'package:od_kec/screens/Home.dart';
import 'package:realm/realm.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  MongoDatabasee obj=new MongoDatabasee();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.email!.toString();
    var substr=user?.substring(user.length-15,user.length-10).toString();
    return Scaffold(
      body : SafeArea(
        child: Container(

          height: 5000,
          child: StreamBuilder<DocumentSnapshot>(
              stream:  FirebaseFirestore.instance.collection(substr!.toUpperCase()).doc(user).snapshots(),
              builder: (context, AsyncSnapshot snapshot) {



                if (snapshot.hasError) {

                  return Text("${snapshot.error}");
                }
                else
                {

                  if(snapshot.hasData)
                  {



                    return Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        actions: [ElevatedButton(onPressed: ()async{ FirebaseAuth.instance.signOut();
                        PersistentNavBarNavigator.pushNewScreen(
                          context,

                          screen: MyHomePage(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context, screen: const MyHomePage(), settings: RouteSettings(name: MyHomePage.routeName));
                        }, child: Icon(Icons.logout,color: Colors.white,))],
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        snapshot.data?.get("name")
                                      ,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      snapshot.data?.get("class"),
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      snapshot.data?.get("Roll No"),
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                   user.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      letterSpacing: 2.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 150,
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                                    child: ListTile(
                                      leading: Icon(Icons.calendar_month, color: Colors.black),
                                      title: Text(
                                        snapshot.data.get("DOB").toString(),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                                    child: ListTile(
                                      leading: Icon(Icons.phone, color: Colors.black),
                                      title: Text(
                                        "+91 ${snapshot.data?.get("phoneno")}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        snapshot.data?.get("adress"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.bloodtype,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        snapshot.data?.get("bgrp"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );



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
}
