import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:human_firewall/Lymean/Fingerprint.dart';
import 'package:human_firewall/Lymean/nav_screen.dart';

class FaceScanning extends StatefulWidget {
  const FaceScanning({super.key});

  @override
  FaceScanningVerify createState() => FaceScanningVerify();
}

class FaceScanningVerify extends State<FaceScanning> {
  bool isSuccess = false; // To control the visibility of the success popup
  bool isLoading = true; // To control loading state

  @override
  void initState() {
    super.initState();

    // Simulate a delay before showing success and transitioning
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isLoading = false;
          isSuccess = true; // Show success message
        });

        // Navigate after the popup duration
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => NavScreen(),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          _buildGradientBackground(),
          _buildBlurOverlay(),

          // Display the face scan icon before success
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.5 - 30,
            child: Image.network(
              isSuccess
                  ? 'https://img.icons8.com/?size=100&id=11695&format=png&color=000000' // After success
                  : 'https://img.icons8.com/?size=100&id=62053&format=png&color=000000', // Before success
              width: 60,
              height: 60,
            ),
          ),

          // Main content with centered message
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fingerprint Image Icon (Replace with verify.png image as requested)
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
                const Text(
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
                
          // Success popup if verification is successful
          if (isSuccess)
            Center(
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Verification Successful!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          // Loading indicator while waiting for verification
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            ),
        ],
      ),
    );
  }

  // Gradient background for smooth look
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

  // Blur effect overlay
  Widget _buildBlurOverlay() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
    );
  }
}
