import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/Widget/collegeProfileScrolling.dart';

class CollegeProfile extends StatefulWidget {
  CollegeProfile({Key? key, required this.collegeDetail}) : super(key: key);

  CollegeDetai collegeDetail;

  @override
  State<CollegeProfile> createState() => _CollegeProfileState(collegeDetail);
}

class _CollegeProfileState extends State<CollegeProfile> {
  _CollegeProfileState(this.collegeDetail);
  CollegeDetai collegeDetail;

  // Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                alignment: Alignment.center,
                height: deviceHeight * 0.1,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.bookmark_border,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: collegeProfileScorrolingPage(context, collegeDetail)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: deviceHeight * 0.06,
                  width: deviceWidth * 0.7,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Apply Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth * 0.05),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
