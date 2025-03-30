// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:human_firewall/Huycheng/Homepage.dart';
// import 'package:human_firewall/Chornay/Community_interface.dart';
// import 'package:human_firewall/Cheat/notifi_cation.dart';
// import 'package:human_firewall/Kanya/quizz_category.dart';

// class NavScreen extends StatefulWidget {
//   @override
//   _NavScreenState createState() => _NavScreenState();
// }

// class _NavScreenState extends State<NavScreen> {
//   int pageIndex = 0;

//   List<Widget> pageList = <Widget>[
//     HomeScreen(),
//     CommunityInterface(),
//     QuizHome(),
//     Notitest(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pageList[pageIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 70, 
//         backgroundColor: Colors.white, // Background color white
//         color: Color(0xFF0081D7), // Navigation bar color
//         animationDuration: Duration(milliseconds: 300),
//         index: pageIndex, // Sync with selected page
//         onTap: (index) {
//           setState(() {
//             pageIndex = index;
//           });
//         },
//         items: [
//           Icon(Icons.home, color: Colors.white, size: 35),
//           Icon(Icons.people, color: Colors.white, size: 35), 
//           Icon(Icons.quiz_outlined, color: Colors.white, size: 35),
//           Icon(Icons.search, color: Colors.white, size: 35),  
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:human_firewall/Huycheng/Homepage.dart';
import 'package:human_firewall/Chornay/Community_interface.dart';
import 'package:human_firewall/Cheat/notifi_cation.dart';
import 'package:human_firewall/Kanya/quizz_category.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    CommunityInterface(),
    QuizHome(),
    Notitest(),
  ];

  // Track navigation history
  final List<int> _navigationHistory = [0];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // If we can go back in our navigation history
        if (_navigationHistory.length > 1) {
          setState(() {
            _navigationHistory.removeLast(); // Remove current
            _currentIndex = _navigationHistory.last; // Go to previous
          });
          return false; // Don't exit app
        }
        return true; // Exit app if no more history
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          backgroundColor: Colors.white,
          color: Color(0xFF0081D7),
          animationDuration: Duration(milliseconds: 300),
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // Only add to history if it's a new selection
              if (_navigationHistory.isEmpty || _navigationHistory.last != index) {
                _navigationHistory.add(index);
              }
            });
          },
          items: [
            Icon(Icons.home, color: Colors.white, size: 35),
            Icon(Icons.people, color: Colors.white, size: 35),
            Icon(Icons.quiz_outlined, color: Colors.white, size: 35),
            Icon(Icons.notifications, color: Colors.white, size: 35), // Changed from search to notifications
          ],
        ),
      ),
    );
  }
}