import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/fingerprint.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  VerifyScreen createState() => VerifyScreen();
}

class VerifyScreen extends State<Verify> {
  @override
  void initState() {
    super.initState();
    
    // Add a 1-second delay before navigating to the next page
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Fingerprint()),
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
    );
  }
}
