import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarModel {
  int id;
  IconData icon;
  String title;
  bool isActive;

  BottomNavBarModel(
      {required this.id,
      required this.title,
      required this.icon,
      required this.isActive});
}

class BottomNavBarProvider extends ChangeNotifier {
  final List<BottomNavBarModel> _BottomNavBar = [
    BottomNavBarModel(
        id: 1, title: "Home", icon: FontAwesomeIcons.house, isActive: true),
    BottomNavBarModel(
        id: 1,
        title: "Search",
        icon: FontAwesomeIcons.searchengin,
        isActive: false),
    BottomNavBarModel(
        id: 1,
        title: "Saved",
        icon: FontAwesomeIcons.floppyDisk,
        isActive: false),
    BottomNavBarModel(
        id: 1, title: "Account", icon: FontAwesomeIcons.user, isActive: false),
  ];

  List<BottomNavBarModel> get BottomNavBar {
    return [..._BottomNavBar];
  }
}
