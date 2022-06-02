import 'package:flutter/cupertino.dart';

class HomePageActivity {
  String title;
  String description;
  String image;
  String chances;
  String about;

  HomePageActivity(
      {required this.title,
      required this.description,
      required this.image,
      required this.chances,
      required this.about});
}

class HomePageActivityProvider extends ChangeNotifier {
  final List<HomePageActivity> _homePageActivity = [
    HomePageActivity(
        title: "Top Colleges",
        description:
            "Search through thousands of accredited colleges and universities online to find the right one for you. Apply in 3 min, and connect with your future.",
        image: "assets/colleges.webp",
        chances: "+126",
        about: "Colleges"),
    HomePageActivity(
        title: "Top Schools",
        description:
            "Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.",
        image: "assets/topSchools.jpeg",
        chances: "+106",
        about: "Schools"),
    HomePageActivity(
        title: "Exams",
        description:
            "Find an end to end information about the exams that are happening in India",
        image: "assets/exams.webp",
        chances: "+16",
        about: "Exams"),
  ];

  List<HomePageActivity> get homePageActivity {
    return [..._homePageActivity];
  }
}
