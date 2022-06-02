import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skygoal/Provider/bottomNavBar.dart';
import 'package:skygoal/Provider/college.dart';
import 'package:skygoal/Provider/homePageProvider.dart';
import 'package:skygoal/Provider/hostelProvider.dart';
import 'package:skygoal/Provider/studentsProvider.dart';
import 'package:skygoal/Utils/colorParser.dart';
import 'package:skygoal/Utils/material_color.dart';
import 'package:skygoal/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HomePageActivityProvider()),
        ChangeNotifierProvider(create: (ctx) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (ctx) => CollegeProvider()),
        ChangeNotifierProvider(create: (ctx) => StudentProvider()),
        ChangeNotifierProvider(create: (ctx) => HostelProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
