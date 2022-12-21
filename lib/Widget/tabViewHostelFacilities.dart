import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/Provider/hostelProvider.dart';
import 'package:skygoal/Provider/studentsProvider.dart';

Widget tabViewHostelFacilities(
    BuildContext context, CollegeDetai collegeDetail) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  Hostel hostel = Provider.of<HostelProvider>(context).hostel;
  int _current = 0;
  List<Map<String, dynamic>> roomType = [
    {"icon": FontAwesomeIcons.bed, "number": 4, "isActive": true},
    {"icon": FontAwesomeIcons.bed, "number": 3, "isActive": false},
    {"icon": FontAwesomeIcons.bed, "number": 2, "isActive": false},
    {"icon": FontAwesomeIcons.bed, "number": 1, "isActive": false},
  ];
  return StatefulBuilder(
    builder: (context, setState) => Container(
      child: Column(
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: roomType.asMap().entries.map((e) {
              return Padding(
                padding: EdgeInsets.only(right: 7),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  decoration: BoxDecoration(
                      color: e.value["isActive"]
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        e.value["icon"],
                        color:
                            e.value["isActive"] ? Colors.white : Colors.black,
                        size: deviceWidth * 0.05,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${e.value["number"]}",
                        style: TextStyle(
                            color: e.value["isActive"]
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: deviceWidth * 0.045),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          )),

          // Hostel Images
          SizedBox(
            height: 10,
          ),
          Container(
            height: deviceHeight * 0.3,
            width: deviceWidth,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CarouselSlider(
                items: hostel.images.asMap().entries.map((e) {
                  return Container(
                      // color: Colors.red,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            e.value,
                            fit: BoxFit.cover,
                          )));
                }).toList(),
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.6,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      print("${_current}");
                    });
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: hostel.images.map(
              (image) {
                int index = hostel.images.indexOf(image);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              },
            ).toList(),
          ),
          // Hostel Details
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(hostel.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: deviceWidth * 0.042)),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${hostel.ratings}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.room_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      hostel.address,
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    hostel.description,
                    style: TextStyle(
                        color: Colors.grey[700], fontSize: deviceWidth * 0.04),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Facilities",
                      style: TextStyle(
                          fontSize: deviceWidth * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.school,
                            size: deviceWidth * 0.052,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            hostel.facilities[0],
                            style: TextStyle(fontSize: deviceWidth * 0.04),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.sink,
                            size: deviceWidth * 0.05,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            hostel.facilities[1],
                            style: TextStyle(fontSize: deviceWidth * 0.04),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
