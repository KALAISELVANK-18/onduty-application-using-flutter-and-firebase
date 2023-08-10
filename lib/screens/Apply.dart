



import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:csv/csv.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:od_kec/screens/Home.dart';
import 'package:od_kec/screens/applysubs/APPl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:od_kec/connect.dart';
import 'package:od_kec/screens/applysubs/OD.dart';

class Appl extends StatefulWidget {
  const Appl({Key? key}) : super(key: key);
  @override
  State<Appl> createState() => _ApplState();
}

class _ApplState extends State<Appl> {
  MongoDatabasee ccc=new MongoDatabasee();
  final List<List<String>> imageList = [
   [ "assets/images/preview.png",'Apply for OD', 'You can apply for ODs by progress to od page and fill the required terms. You can check your OD status any time!','Participate in events and know your od limitations.'],["assets/images/leave-management.png",'Apply for Leave','You can apply for leavess by writing reasons and fill the required terms. You can check your leave status any time!','Take leaves and maintain attendence!'],[ "assets/images/Manage-Customer-Responses.png",'Post your complaints','You can request for complaints by requesting with correct reasons and fill the required terms. You can check your request status any time!','Request complaint with reasons!']
  ];

  @override
  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(

          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.95,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(height: 50,),


                      Center(child: Text("Apply yours",style: GoogleFonts.aBeeZee(textStyle:TextStyle(fontSize: 25,color: Colors.white) ) ,)),

                  SizedBox(height: 50,),

                  GFCarousel(
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    viewportFraction: 1.0,
                    hasPagination: true,
                    height: 550,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    items: imageList.map(
                          (url) {
                        return

                            Container(
                              margin: EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    child: Image.asset(

                                        url[0],
                                       width: MediaQuery.of(context).size.width,height: 200,

                                    ),
                                  ),SizedBox(height: 40,),
                                  Text(url[1],style: GoogleFonts.aclonica(fontSize: 19,fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.only(top:50),
                                    child: Center(child: Text(url[2],style:GoogleFonts.ptSans(fontSize: 14,color: Colors.white),textAlign: TextAlign.justify)),
                                  ),
                                  SizedBox(height: 60,),
                                  Text(url[3],style:GoogleFonts.aBeeZee(fontSize: 10,color: Colors.red),textAlign: TextAlign.justify)
                                ],
                              )
                            );



                      },
                    ).toList(),
                    onPageChanged: (index) {
                      setState(() {
                        index;
                      });
                    },
                  ),




                ],mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: SpeedDial(
        icon:Icons.add,
         activeIcon: Icons.close,
         useRotationAnimation: true,
         animationDuration: Duration(milliseconds: 200),
         closeManually: false,
         renderOverlay: false,
         backgroundColor: Colors.redAccent[200],
         closeDialOnPop: true,
         spaceBetweenChildren: 4,
         spacing: 3,
         children: [
           SpeedDialChild(
             labelWidget: Padding(

               padding: const EdgeInsets.all(8.0),
               child: Container(width: 57,height: 27,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                   child: Center(child: Text("pre od",style: GoogleFonts.aBeeZee(textStyle:TextStyle(color: Colors.black) ) ,))),
             ),
             child: IconButton(icon:Icon(Icons.add_to_home_screen),color: Colors.green,onPressed: (){
               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                   context,
                   settings: RouteSettings(name: Odrequest.routeName),
               screen: const Odrequest(),
               withNavBar: true,
               pageTransitionAnimation: PageTransitionAnimation.fade,);
             },
           ),),
           SpeedDialChild(
               labelWidget: Padding(

                 padding: const EdgeInsets.all(8.0),
                 child: Container(width: 57,height: 27,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                     child: Center(child: Text("od",style: GoogleFonts.aBeeZee(textStyle:TextStyle(color: Colors.black) ) ,))),
               ),
               child: IconButton(icon:Icon(Icons.touch_app_outlined,color: Colors.orangeAccent),onPressed: (){

               },)
           ),
           SpeedDialChild(

               labelWidget: Padding(

                 padding: const EdgeInsets.all(8.0),
                 child: Container(width: 57,height: 27,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                     child: Center(child: Text("leave",style: GoogleFonts.aBeeZee(textStyle:TextStyle(color: Colors.black) ) ,))),
               ),
             child: IconButton(icon:Icon(Icons.article_outlined,color: Colors.lightBlueAccent),onPressed: (){
               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                 context,
                 settings: RouteSettings(name: LeaveRequest.routeName),
                 screen: const LeaveRequest(),
                 withNavBar: true,
                 pageTransitionAnimation: PageTransitionAnimation.fade,);
             },)
           )
         ],
        ),
      )
    );
  }






}



/*Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FabCircularMenu(

          ringDiameter: 400,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: const Duration(milliseconds: 400),
          fabColor: Colors.redAccent[200],
            fabOpenIcon: Icon(Icons.add,color: Colors.white,),
            fabCloseIcon: Icon(Icons.close,color: Colors.white,),
            alignment: Alignment.bottomRight,
            ringColor: Color.fromARGB(0, 0, 0, 0),
            fabIconBorder: CircleBorder(),
            fabSize: 60,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(bottom:12.0),
                child: FloatingActionButton(
                  heroTag: "hero1",
                  onPressed: () {


                  },

                  elevation: 10.0,
                  backgroundColor: Colors.orangeAccent,
                  child: IconButton(
                    onPressed: (){
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: RouteSettings(name: LeaveRequest.routeName),
                        screen: const LeaveRequest(),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );

                    },
                   icon: Icon(Icons.add_to_home_screen),
                  ),

                  shape: CircleBorder(),
                ),
              ),
              FloatingActionButton(
                heroTag: "hero3",
                onPressed: () {

                },

                elevation: 10.0,
                backgroundColor: Colors.redAccent,
                child: IconButton(
                  onPressed: (){
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: Odrequest.routeName),
                      screen: const Odrequest(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  icon: Icon(Icons.back_hand_rounded),
                ),

                shape: CircleBorder(),
              ),


            ]),
      ),*/



