
import 'package:flutter/material.dart';

import 'package:od_kec/my_tab_bar.dart';
import 'package:od_kec/screens/subs/ODP.dart';
import 'package:od_kec/screens/subs/LP.dart';
import 'package:od_kec/screens/subs/CP.dart';

import 'package:google_fonts/google_fonts.dart';
class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> with TickerProviderStateMixin {
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
  void dispose() {
    tabController.addListener(() {
      onTabChange();
    });

    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

        title: Center(
          child: Text(
            'Status',style: GoogleFonts.aBeeZee(fontSize: 18,
            fontWeight: FontWeight.w600,),

          ),
        ),

        elevation: 0,
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          MyTabBar(tabController: tabController),
          Expanded(
            child: Container(

              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: TabBarView(
                controller: tabController,
                children: [

                  ODP(),

                  CP(),
                  LP(),

                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
