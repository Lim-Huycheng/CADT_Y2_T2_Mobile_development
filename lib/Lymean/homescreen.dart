import 'dart:async';
import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/signup.dart';

class CombinedGroup extends StatefulWidget {
  const CombinedGroup({super.key});

  @override
  _CombinedGroupState createState() => _CombinedGroupState();
}

class _CombinedGroupState extends State<CombinedGroup> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late Timer _timer;

  final List<Map<String, String>> slides = [
    {
      "image": "assets/images/security.jpg",
      "title": "Security",
      "text": "Security isn’t just a technology problem!\nIt’s a personal responsibility, protect your data and protect your future."
    },
    {
      "image": "assets/images/threat.jpg",
      "title": "Threat",
      "text": "Every threat is an opportunity to strengthen your defenses! Don’t wait for the attack, prepare for it."
    },
    {
      "image": "assets/images/social.jpg",
      "title": "Social",
      "text": "A community forum is where knowledge is shared, ideas are exchanged, and solutions are built together."
    },
    {
      "image": "assets/images/quiz.jpg",
      "title": "Quiz",
      "text": "Test your knowledge, sharpen your skills! Because in cybersecurity, staying informed is the first step to staying secure."
    },
    
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < slides.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Reset to the first slide
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Slideshow Section
            SizedBox(
              width: 340,
              height: 340,
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(slides[index]["image"]!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dynamic Title
            Text(
              slides[_currentIndex]["title"]!,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                fontFamily: 'SourceSerif',
              ),
            ),
            const SizedBox(height: 10),

            // Dynamic Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                slides[_currentIndex]["text"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SourceSans',
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationForm()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0081D7),
                      minimumSize: const Size(389, 60),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CombinedGroup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8B2D),
                      minimumSize: const Size(389, 60),
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
