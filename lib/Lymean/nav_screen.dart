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
    Notitest(),
  ];

  // Global key to manage the scaffold
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button behavior
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          _scaffoldKey.currentState!.openEndDrawer();
          return false;
        } else {
          return true; // Let the back button do its default behavior
        }
      },
      child: Scaffold(
        key: _scaffoldKey, // Assign the scaffold key
        body: pageList[pageIndex],
        bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          backgroundColor: Colors.white,
          color: Color(0xFF0081D7),
          animationDuration: Duration(milliseconds: 300),
          index: pageIndex,
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
      ),
    );
  }
}
