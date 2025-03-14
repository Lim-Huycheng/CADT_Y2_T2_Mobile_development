import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/signup.dart';

class CombinedGroup extends StatelessWidget {
  const CombinedGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Group18 Content (Security Section)
            Container(
              width: 340,
              height: 340,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/security.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Security',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                fontFamily: 'SourceSerif',
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Security isn’t just a technology problem! \n It’s a personal responsibility, protect your data and protect your future.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SourceSans',
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Group10 Content (Sign Up/Login Buttons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the second page when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationForm()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0081D7),
                      minimumSize: Size(389, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'SuezOne',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the second page when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CombinedGroup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF8B2D),
                      minimumSize: Size(389, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'SuezOne',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
