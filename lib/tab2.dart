import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key, required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor = Color(0xff7C7B9B);
    Color kPrimaryColorVariant = Color(0xff686795);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      height: 80,
      color: Colors.black,
      child: TabBar(

        controller: tabController,
        indicator: BoxDecoration(

          border: Border(bottom: BorderSide(color: Colors.white,width: 2))
        ),
        tabs: [


          Tab(
            icon: Text(
              'Approved',
              style: GoogleFonts.comfortaa(color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,),



            ),
          ),
          Tab(
            icon: Text(
              'Pending',
              style: GoogleFonts.comfortaa(color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,),



            ),
          ),
          Tab(
            icon: Text(
              'Rejected',

              style: GoogleFonts.comfortaa(color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,),
            ),
          ),
        ],
      ),
    );

  }

}
