import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skygoal/Provider/bottomNavBar.dart';
import 'package:skygoal/Provider/homePageProvider.dart';
import 'package:skygoal/Widget/appBarSearchAndMic.dart';
import 'package:skygoal/Widget/appBarTitle.dart';
import 'package:skygoal/Widget/bottomNavigationBar.dart';
import 'package:skygoal/pages/listOfCollegesPage.dart';

enum SingingCharacter {
  Nothing,
  Technology,
  Architecture,
  Pharmacy,
  Law,
  Management
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SingingCharacter _character = SingingCharacter.Nothing;
  List<Map<String, dynamic>> optionList = [
    {
      "title": "Bachelor Of Technology",
      "icon": FontAwesomeIcons.graduationCap,
      "singingCharacter": SingingCharacter.Technology
    },
    {
      "title": "Bachelor Of Architecture",
      "icon": FontAwesomeIcons.building,
      "singingCharacter": SingingCharacter.Architecture
    },
    {
      "title": "Pharmacy",
      "icon": FontAwesomeIcons.prescriptionBottleMedical,
      "singingCharacter": SingingCharacter.Pharmacy
    },
    {
      "title": "Law",
      "icon": FontAwesomeIcons.scaleBalanced,
      "singingCharacter": SingingCharacter.Law
    },
    {
      "title": "Management",
      "icon": FontAwesomeIcons.usersGear,
      "singingCharacter": SingingCharacter.Management
    },
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    List<HomePageActivity> homepageActivity =
        Provider.of<HomePageActivityProvider>(context).homePageActivity;
    List<BottomNavBarModel> bottomNavBar =
        Provider.of<BottomNavBarProvider>(context).BottomNavBar;
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
        child: SingleChildScrollView(
          child: Container(
            height: deviceHeight * 0.9,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.08,
                      vertical: deviceHeight * 0.025),
                  width: deviceWidth,
                  height: deviceHeight * 0.25,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appBarTextAndNotification(context),
                      // SizedBox(
                      //   height: deviceHeight * 0.03,
                      // ),
                      appBarSearchAndMic(context)
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.05,
                      vertical: deviceHeight * 0.02),
                  // color: Colors.amber,
                  child: Column(
                      children: homepageActivity.asMap().entries.map((e) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: deviceWidth,
                              height: deviceHeight * 0.19,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  e.value.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: deviceWidth,
                              height: deviceHeight * 0.19,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.black.withOpacity(0.9),
                                      Colors.black.withOpacity(0)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Positioned(
                              top: deviceHeight * 0.04,
                              left: deviceWidth * 0.03,
                              child: Container(
                                // color: Colors.amber,
                                width: deviceWidth * 0.72,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.value.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: deviceWidth * 0.055),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      e.value.description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: deviceWidth * 0.04),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("Clicked");
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: deviceWidth * 0.06,
                                              vertical: deviceWidth * 0.06),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Sort By",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              deviceWidth *
                                                                  0.05),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: Colors.grey,
                                                          size: deviceWidth *
                                                              0.08,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              const Divider(),
                                              Expanded(
                                                child: Container(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: optionList
                                                          .asMap()
                                                          .entries
                                                          .map((e) {
                                                        return Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(e.value[
                                                                        "icon"]),
                                                                    SizedBox(
                                                                      width: deviceWidth *
                                                                          0.04,
                                                                    ),
                                                                    Text(
                                                                      e.value[
                                                                          "title"],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              deviceWidth * 0.04),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Radio<
                                                                      SingingCharacter>(
                                                                  // toggleable: true,
                                                                  value: e.value[
                                                                      "singingCharacter"],
                                                                  groupValue:
                                                                      _character,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _character =
                                                                          e.value[
                                                                              "singingCharacter"];
                                                                    });
                                                                    // Navigate
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (_) =>
                                                                                ListOfColleges()));
                                                                  }),
                                                            ],
                                                          ),
                                                        );
                                                      }).toList()),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: Container(
                                width: deviceWidth,
                                height: deviceHeight * 0.19,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(60))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      e.value.chances,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      e.value.about,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        if (e.key != homepageActivity.length - 1)
                          const SizedBox(
                            height: 10,
                          ),
                      ],
                    );
                  }).toList()),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
