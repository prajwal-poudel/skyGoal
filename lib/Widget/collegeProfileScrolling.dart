import 'package:flutter/material.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/Widget/collegeProfileTitleSecion.dart';
import 'package:skygoal/Widget/tabViewAboutCollege.dart';
import 'package:skygoal/Widget/tabViewHostelFacilities.dart';

Widget collegeProfileScorrolingPage(
    BuildContext context, CollegeDetai collegeDetail) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return Container(
    // padding: EdgeInsets.symmetric(
    //     horizontal: deviceWidth * 0.03, vertical: deviceHeight * 0.02),
    child: ListView(
      children: [
        Container(
          height: deviceHeight * 0.25,
          color: Colors.blue,
          child: ClipRRect(
            child: Image.asset(
              collegeDetail.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        collegeProfileTitleSection(context, collegeDetail),
        DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  child: Container(
                    height: deviceHeight * 0.06,
                    child: TabBar(tabs: [
                      Text(
                        "About College",
                        // maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontSize: deviceWidth * 0.032),
                      ),
                      Text(
                        "Hostel Facility",
                        style: TextStyle(
                            color: Colors.black, fontSize: deviceWidth * 0.032),
                      ),
                      Text(
                        "Q & A",
                        style: TextStyle(
                            color: Colors.black, fontSize: deviceWidth * 0.032),
                      ),
                      Text(
                        "Events",
                        style: TextStyle(
                            color: Colors.black, fontSize: deviceWidth * 0.032),
                      ),
                    ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: deviceHeight * 0.03,
                      horizontal: deviceWidth * 0.07),
                  width: deviceWidth,
                  height: deviceHeight * 0.9,
                  // color: Colors.pink,
                  child: TabBarView(children: [
                    tabViewAboutCollege(context, collegeDetail),
                    tabViewHostelFacilities(context, collegeDetail),
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_car),
                  ]),
                )
              ],
            )),
      ],
    ),
  );
}
