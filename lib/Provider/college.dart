import 'package:flutter/cupertino.dart';

class CollegeDetai {
  int id;
  String name;
  String description;
  String image;
  double rating;
  String acchivement;
  int views;

  CollegeDetai(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.rating,
      required this.acchivement,
      required this.views});
}

class CollegeOnly {
  String name;
  CollegeOnly({required this.name});
}

class CollegeProvider extends ChangeNotifier {
  final List<CollegeOnly> _collegeOnly = [
    CollegeOnly(name: "College of Law"),
    CollegeOnly(name: "College of Management"),
    CollegeOnly(name: "College of Human Resources"),
    CollegeOnly(name: "College of Cooking"),
  ];
  List<CollegeOnly> get collegeOnly {
    return [..._collegeOnly];
  }

  final List<CollegeDetai> _collegeList = [
    CollegeDetai(
        id: 1,
        name: "GHJK Engineering college",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        image: "assets/college1.jpeg",
        rating: 4.3,
        acchivement: "More than 1000+ students have been placed",
        views: 468),
    CollegeDetai(
        id: 2,
        name: "Bachelor of Technology",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        image: "assets/college2.jpeg",
        rating: 4.3,
        acchivement: "Lorem Ipsum is simply dummy text of the printing",
        views: 468),
    CollegeDetai(
        id: 3,
        name: "Bachelor of Architecture",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        image: "assets/college3.jpeg",
        rating: 4.3,
        acchivement: "More than 1000+ students have been placed",
        views: 468),
  ];

  List<CollegeDetai> get collegeList {
    return [..._collegeList];
  }
}
