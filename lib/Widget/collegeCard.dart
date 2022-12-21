import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/pages/collegeProfilePage.dart';

Widget collegeCard(BuildContext context, CollegeDetai collegeDetail) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () {
      print(collegeDetail.id);
      print("Clicked");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CollegeProfile(collegeDetail: collegeDetail)));
    },
    child: Card(
      // type: MaterialType.card,
      elevation: 5,
      // color: Colors.red,
      surfaceTintColor: Colors.amber,
      // borderRadius: BorderRadius.circular(20),
      child: Container(
        width: deviceWidth,
        height: deviceHeight * 0.36,
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: deviceWidth,
                  height: deviceHeight * 0.16,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    child: Image.asset(
                      collegeDetail.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 8,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.share_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 8,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.bookmark_border,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              collegeDetail.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${collegeDetail.rating}",
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
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: deviceWidth * 0.5,
                              // color: Colors.red,
                              child: Text(
                                collegeDetail.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: deviceWidth * 0.025),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(
                                "Apply Now",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                    Divider(
                      thickness: 2,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.idBadge,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  collegeDetail.acchivement,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: deviceWidth * 0.025,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${collegeDetail.views}+",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: deviceWidth * 0.03),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
