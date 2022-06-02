import 'package:flutter/cupertino.dart';

class Hostel {
  String name;
  List<String> images;
  double ratings;
  String address;
  String description;
  List<String> facilities;

  Hostel(
      {required this.name,
      required this.images,
      required this.ratings,
      required this.address,
      required this.description,
      required this.facilities});
}

class HostelProvider extends ChangeNotifier {
  Hostel _hostel = Hostel(
      name: "GHJK Engineering Hostel",
      images: [
        "assets/hostel1.webp",
        "assets/hostel2.jpeg",
        "assets/hostel3.jpeg",
        "assets/hostel4.jpeg",
        "assets/hostel5.jpeg",
        "assets/hostel6.jpg",
      ],
      address: "Lorem Ipsum is simply dummy text ",
      ratings: 4.3,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
      facilities: ["College in 400mtrs", "Bathroms: 2"]);

  Hostel get hostel {
    return _hostel;
  }
}
