import 'package:flutter/material.dart';

Widget bottomNavBarWidget(BuildContext context, MapEntry e) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        e.value.icon,
        size: deviceWidth * 0.06,
        color: e.value.isActive ? Colors.white : Colors.grey,
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        e.value.title,
        style: TextStyle(color: e.value.isActive ? Colors.white : Colors.grey),
      ),
      SizedBox(
        height: 5,
      ),
      if (e.value.isActive)
        Container(
          width: 60,
          height: 3,
          color: Colors.white,
        )
    ],
  ));
}
