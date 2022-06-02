import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/Provider/studentsProvider.dart';

Widget tabViewAboutCollege(BuildContext context, CollegeDetai collegeDetail) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  List<StudentDetail> students = Provider.of<StudentProvider>(context).students;
  Completer<GoogleMapController> _controller = Completer();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  return StatefulBuilder(
      builder: ((context, setState) => Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.black, fontSize: deviceWidth * 0.055),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        collegeDetail.description,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: deviceWidth * 0.035),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: deviceWidth * 0.055),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: deviceHeight * 0.2,
                      decoration: BoxDecoration(
                          // color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: GoogleMap(
                          mapType: MapType.hybrid,
                          initialCameraPosition: CameraPosition(
                            target:
                                LatLng(37.42796133580664, -122.085749655962),
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Student Review",
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: deviceWidth * 0.055),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: deviceHeight * 0.08,
                          decoration: BoxDecoration(
                              // color: Colors.grey[700],
                              ),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: students.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: deviceWidth * 0.013),
                                  child: Container(
                                    width: deviceWidth * 0.14,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: students.length - 1 == index
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "+12",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize:
                                                            deviceWidth * 0.04),
                                                  ),
                                                ],
                                              )
                                            : Image.asset(
                                                students[index].image,
                                                fit: BoxFit.cover,
                                              )),
                                  ),
                                );
                              })),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              width: deviceWidth,
                              height: deviceHeight * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    students[0].fullname,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    students[0].review,
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: deviceWidth * 0.03),
                                  ),
                                  Expanded(
                                    child: Container(
                                      // color: Colors.blue,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: students[0].rating,
                                          itemBuilder: ((context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 222, 176, 8),
                                            );
                                          })),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ))
                  ],
                ))
              ],
            ),
          )));
}
