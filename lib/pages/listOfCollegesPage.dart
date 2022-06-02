import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:skygoal/Provider/bottomNavBar.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/Widget/bottomNavigationBar.dart';
import 'package:skygoal/Widget/collegeCard.dart';
import 'package:skygoal/Widget/searchAndMicOptionAppBar.dart';

class ListOfColleges extends StatefulWidget {
  const ListOfColleges({Key? key}) : super(key: key);

  @override
  State<ListOfColleges> createState() => _ListOfCollegesState();
}

class _ListOfCollegesState extends State<ListOfColleges> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    List<BottomNavBarModel> bottomNavBar =
        Provider.of<BottomNavBarProvider>(context).BottomNavBar;
    List<CollegeOnly> collegeOnly =
        Provider.of<CollegeProvider>(context).collegeOnly;
    List<CollegeDetai> collegeDetail =
        Provider.of<CollegeProvider>(context).collegeList;
    return Scaffold(
      bottomNavigationBar: Material(
        child: Container(
          height: deviceHeight * 0.075,
          width: deviceWidth,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomNavBar.asMap().entries.map((e) {
              return bottomNavBarWidget(context, e);
            }).toList(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceWidth * 0.08,
                    vertical: deviceHeight * 0.025),
                width: deviceWidth,
                height: deviceHeight * 0.18,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: searchAndMicOptionAppBar(context)),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: deviceWidth,
                height: deviceHeight * 0.05,
                // color: Colors.pink,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: collegeOnly.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: deviceWidth * 0.02),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Text(collegeOnly[index].name),
                          ),
                        )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: deviceHeight * 0.02,
                  horizontal: deviceWidth * 0.06),
              // color: Colors.amber,
              child: ListView.builder(
                  itemCount: collegeDetail.length,
                  itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: collegeCard(context, collegeDetail[index]))),
            ))
          ],
        ),
      ),
    );
  }
}
