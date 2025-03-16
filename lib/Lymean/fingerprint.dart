import 'package:flutter/material.dart';

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
            left: 65,
            top: 625,
            child: SizedBox(
              width: 287,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Change to',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Source Serif Pro',
                        fontWeight: FontWeight.w400,
                        height: 2.08,
                      ),
                    ),
                    TextSpan(
                      text: ' Face option',
                      style: TextStyle(
                        color: Color(0xFF0081D7),
                        fontSize: 24,
                        fontFamily: 'Source Serif Pro',
                        fontWeight: FontWeight.w400,
                        height: 2.08,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
           _buildImage(screenWidth * 0.2, screenHeight * 0.11, 80, "https://img.icons8.com/?size=100&id=21602&format=png&color=000000"),
        ],
      ),
    );
  }
}

  // Custom method to build the image widget
Widget _buildImage(double left, double top, double size, String url) {
  return Positioned(
    left: 170, // Use the left argument for dynamic positioning
    top: 700, // Use the top argument for dynamic positioning
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
  );
}