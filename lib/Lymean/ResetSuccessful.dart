import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/nav_screen.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  SuccessfulScreen createState() => SuccessfulScreen();
}

class SuccessfulScreen extends State<Successful> {
  @override
  void initState() {
    super.initState();
    
    // Add a 1-second delay before navigating to the next page
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keeps the content centered vertically
          children: [
            Container(
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/success.jpg"),
                  fit: BoxFit.contain, // Ensures the image is contained within
                ),
              ),
            ),
            const SizedBox(height: 30), // Space between image and text
            const Text(
              'Your password \nhas been updated successfully !',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF0081D7),
                fontSize: 30,
                fontFamily: 'Source Serif Pro',
                fontWeight: FontWeight.w600,
                letterSpacing: 3.80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
