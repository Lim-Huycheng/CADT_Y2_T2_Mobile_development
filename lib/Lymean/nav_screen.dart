import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:human_firewall/Huycheng/Homepage.dart';
import 'package:human_firewall/Chornay/Community_newfeed.dart';
import 'package:human_firewall/Cheat/noti.dart';
import 'package:human_firewall/Kanya/quizz_category.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    PostFeedPage(),
    QuizHome(),
    Notitestification_full(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 70, 
        backgroundColor: Colors.white, // Background color white
        color: Color(0xFF0081D7), // Navigation bar color
        animationDuration: Duration(milliseconds: 300),
        index: pageIndex, // Sync with selected page
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 35),
          Icon(Icons.people, color: Colors.white, size: 35), 
          Icon(Icons.quiz_outlined, color: Colors.white, size: 35),
          Icon(Icons.search, color: Colors.white, size: 35),  
        ],
      ),
    );
  }
}


