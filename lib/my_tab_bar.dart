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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      height: 80,
      color: Colors.blueAccent,
      child: TabBar(
        indicatorColor: Colors.black,
        controller: tabController,
        indicator: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        tabs: [
          Tab(
            icon: Text(
              'Pre OD',
              style: GoogleFonts.aclonica(fontSize: 12,
                fontWeight: FontWeight.w600,),

            ),
          ),
          Tab(
            icon: Text(
              'OD',
              style: GoogleFonts.aclonica(fontSize: 12,
                fontWeight: FontWeight.w600,),
            ),
          ),
          Tab(
            icon: Text(
              'Leaves',
              style: GoogleFonts.aclonica(fontSize: 11,
                fontWeight: FontWeight.w600,),
            ),
          ),
        ],
      ),
    );
  }
}
