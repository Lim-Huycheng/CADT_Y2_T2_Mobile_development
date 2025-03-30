import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/FaceScan.dart';
import 'package:human_firewall/Lymean/nav_screen.dart';

class Fingerprint extends StatefulWidget {
  const Fingerprint({super.key});

  @override
  FingerprintVerify createState() => FingerprintVerify();
}

class FingerprintVerify extends State<Fingerprint> {
  bool isVerified = false; // Flag to track if verification is successful

  @override
  void initState() {
    super.initState();
    print("Fingerprint screen initialized");
  }

  @override
  void dispose() {
    print("Fingerprint screen disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background with smooth gradient
          _buildGradientBackground(),

          // Centered content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fingerprint Image Icon
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/verify.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Show verification status text
                isVerified
                    ? const Text(
                        'Verification Successful!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Serif Pro',
                        ),
                      )
                    : const Text(
                        'Please verify your identity before proceeding.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SourceSerif',
                        ),
                      ),
              ],
            ),
          ),

          // "Change to Face Scanning" Button (Now positioned higher to avoid overlap)
          Positioned(
            left: 0,
            right: 0,
            bottom: screenHeight * 0.28, // Move the text up a bit
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Change to Face Scanning option
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const FaceScanning()),
                    );
                  });
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Switch to ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "Face Scanning",
                        style: TextStyle(
                          color: Color(0xFF0081D7),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Fingerprint icon (Now clickable to simulate verification)
          Positioned(
            left: screenWidth * 0.4,
            top: screenHeight * 0.75,
            child: GestureDetector(
              onTap: () {
                // Simulate the fingerprint scan verification
                if (mounted) {
                  setState(() {
                    isVerified = true; // Verification is successful when icon is tapped
                  });

                  // Navigate to the next screen after a short delay
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NavScreen()),
                    );
                  });
                }
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://img.icons8.com/?size=100&id=21602&format=png&color=000000"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Gradient Background
  Widget _buildGradientBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent.shade100, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
