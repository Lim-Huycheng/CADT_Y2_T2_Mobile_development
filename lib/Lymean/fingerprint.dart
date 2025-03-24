import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/FaceScan.dart';
import 'package:human_firewall/Huycheng/Homepage.dart';
import 'package:human_firewall/Lymean/Login.dart';
import 'package:human_firewall/Lymean/signup.dart';

class Fingerprint extends StatefulWidget {
  const Fingerprint({super.key});

  @override
  FingerprintVerify createState() => FingerprintVerify();
}

class FingerprintVerify extends State<Fingerprint> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Stack(
        children: [
          // Background overlay effect
          Positioned.fill(
            child: Opacity(
              opacity: 0.30,
              child: Container(color: Colors.black),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Keeps the content centered vertically
              children: [
                Container(
                  width: 200, // Adjust width as needed
                  height: 200, // Adjust height as needed
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/verify.png"),
                      fit: BoxFit.contain, // Ensures the image is contained within
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Space between image and text
                const Text(
                  'Verify before you can \nprocess our platform',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Serif Pro', 
                  ),
                ),
              ],
            ),
          ),
          // Positioned widget for overlay effect
          Positioned(
            left: 0,
            top: 0,
            child: Opacity(
              opacity: 0.30,
              child: Container(
                width: 440,
                height: 956,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
          ),
          // Positioned widget for the "Change to Face option" text
          Positioned(
            left: 85, // Set the desired left position
            top: 625,
          child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensures the Row wraps content
                children: [
                  const Text(
                    "Change to ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate directly to Terms and Conditions Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FaceScanning()),
                      );
                    },
                    child: const Text(
                      'Face Scanning',
                      style: TextStyle(
                        color: const Color(0xFF0081D7),
                        fontSize: 24,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Clickable icon for navigation
          _buildClickableIcon(screenWidth * 0.4, screenHeight * 0.1, 80,
              "https://img.icons8.com/?size=100&id=21602&format=png&color=000000"),
        ],
      ),
    );
  }

  // Custom method to build the clickable icon widget
  Widget _buildClickableIcon(double left, double top, double size, String url) {
    return Positioned(
      left: left, // Use the left argument for dynamic positioning
      top: 700, // Use the top argument for dynamic positioning
      child: GestureDetector(
        onTap: () {
          // Navigate to FaceScanning screen when the icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomepageScreen()),
          );
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover, // Adjusts the image to cover the area
            ),
          ),
        ),
      ),
    );
  }
}
