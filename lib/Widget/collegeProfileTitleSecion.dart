import 'package:flutter/material.dart';
import 'package:skygoal/Provider/college.dart';

Widget collegeProfileTitleSection(
    BuildContext context, CollegeDetai collegeDetail) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return Stack(
    children: [
      Material(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.09),
          height: deviceHeight * 0.13,
          width: deviceWidth,
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                collegeDetail.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: deviceWidth * 0.05),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Container(
                  // color: Colors.pink,
                  width: deviceWidth * 0.65,
                  child: Text(
                    collegeDetail.description,
                    maxLines: 4,
                    style: TextStyle(
                        color: Colors.grey, fontSize: deviceWidth * 0.03),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        right: 10,
        top: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 17),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              Text(
                "${collegeDetail.rating}",
                style: TextStyle(
                    fontSize: deviceWidth * 0.045,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Icon(
                Icons.star,
                color: Colors.white,
                size: deviceWidth * 0.07,
              )
            ],
          ),
        ),
      )
    ],
  );
}
