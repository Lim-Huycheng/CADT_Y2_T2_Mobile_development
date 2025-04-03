import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:human_firewall/Huycheng/HomePage.dart';
import 'package:human_firewall/Chornay/Community_newfeed.dart'; // Main community feed page
import 'package:human_firewall/Huycheng/search.dart';
import 'package:human_firewall/Kanya/quizz_category.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int pageIndex = 0; // Default index for Home screen

  List<Widget> pageList = <Widget>[
    HomeScreen(),           // Home screen
    PostFeedPage(),         // Main community feed page
    QuizHome(),             // Quiz home page
    Search(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],  // Display the corresponding page based on pageIndex
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Color(0xFF0081D7),
        animationDuration: Duration(milliseconds: 300),
        index: pageIndex,  // Sync the navigation bar index with pageIndex
        onTap: (index) {
          setState(() {
            pageIndex = index;  // Update the pageIndex when tapping nav bar items
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 30),  // Home icon
          Icon(Icons.people, color: Colors.white, size: 30),  // Community icon
          Icon(Icons.quiz_outlined, color: Colors.white, size: 30),  // Quiz icon
          Icon(Icons.search, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}
