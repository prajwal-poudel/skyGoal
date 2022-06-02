import 'package:flutter/material.dart';

Widget searchAndMicOptionAppBar(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.01),
          alignment: Alignment.centerLeft,
          width: deviceWidth * 0.63,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.grey,
                hintText: "Search for colleges, schools",
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ),
        )
      ],
    ),
  );
}
