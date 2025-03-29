import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/Fingerprint.dart';
import 'package:human_firewall/Huycheng/HomePage0.dart';
import 'package:human_firewall/Lymean/nav_screen.dart';

class FaceScanning extends StatefulWidget {
  const FaceScanning({super.key});

  @override
  FaceScanningVerify createState() => FaceScanningVerify();
}

class FaceScanningVerify extends State<FaceScanning> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.30,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          
          // Icon at the top
          _buildIcon(screenWidth * 0.5 - 30, screenHeight * 0.05, 60, 
            "https://img.icons8.com/?size=100&id=Qu0nygt1B9eA&format=png&color=000000"
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
            left: 105, // Set the desired left position
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
                        MaterialPageRoute(builder: (context) => const Fingerprint()),
                      );
                    },
                    child: const Text(
                      'Fingerprint',
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
        ],
      ),
    );
  }

  Widget _buildIcon(double left, double top, double size, String url) {
    return Positioned(
      left: left,
      top: 80,
      child: SizedBox(
        width: size,
        height: size,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
