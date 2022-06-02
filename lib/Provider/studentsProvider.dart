import 'package:flutter/cupertino.dart';

class StudentDetail {
  String image;
  String fullname;
  String review;
  int rating;

  StudentDetail(
      {required this.image,
      required this.fullname,
      required this.review,
      required this.rating});
}

class StudentProvider extends ChangeNotifier {
  final List<StudentDetail> _students = [
    StudentDetail(
        image: "assets/user1.jpeg",
        fullname: "Arun Sai",
        review:
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        rating: 4),
    StudentDetail(
        image: "assets/user2.webp",
        fullname: "Sita Kunwar",
        review:
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        rating: 4),
    StudentDetail(
        image: "assets/user3.jpeg",
        fullname: "Katrina Kaif",
        review:
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        rating: 4),
    StudentDetail(
        image: "assets/user4.jpeg",
        fullname: "Michel Jorden ",
        review:
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        rating: 4),
    StudentDetail(
        image: "assets/user1.jpeg",
        fullname: "No Body",
        review:
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        rating: 4),
  ];

  List<StudentDetail> get students {
    return [..._students];
  }
}
