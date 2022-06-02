import 'package:flutter/material.dart';

Widget appBarTextAndNotification(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // color: Colors.red,
          height: deviceHeight * 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find your own way",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: deviceWidth * 0.05),
              ),
              SizedBox(
                height: deviceHeight * 0.015,
              ),
              Text("Search in 600 colleges around!",
                  style: TextStyle(
                      color: Colors.white, fontSize: deviceWidth * 0.035)),
            ],
          ),
        ),
        Container(
            height: deviceHeight * 0.1,
            // color: Colors.pink,
            child: Column(
              children: [
                Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    Positioned(
                      right: 1,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    ),
  );
}
