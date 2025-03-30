import 'package:flutter/material.dart';
import 'dart:async';
import 'package:human_firewall/Kanya/quizz_category.dart';
import 'package:human_firewall/Cheat/addfavorite.dart';
import 'package:human_firewall/Chornay/Community_newfeed.dart';
import 'package:human_firewall/Cheat/noti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  late Timer _carouselTimer;
  int _currentPage = 0;
  
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _carouselTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _carouselSlides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset to the first slide
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _carouselTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }


  final List<Map<String, dynamic>> _carouselSlides = [
    {
      "title": "Security",
      "text": "Security isn't just a technology problem!\nIt's a personal responsibility, protect your data and protect your future.",
      "icon": Icons.security,
      "color": Colors.blue,
      "image": "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    },
    {
      "title": "Threat",
      "text": "Every threat is an opportunity to strengthen your defenses! Don't wait for the attack, prepare for it.",
      "icon": Icons.warning,
      "color": Colors.red,
      "image": "https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    },
    {
      "title": "Social",
      "text": "A community forum is where knowledge is shared, ideas are exchanged, and solutions are built together.",
      "icon": Icons.forum,
      "color": Colors.green,
      "image": "https://images.unsplash.com/photo-1581094794329-c8112a89af12?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    },
    {
      "title": "Quiz",
      "text": "Test your knowledge, sharpen your skills! Because in cybersecurity, staying informed is the first step to staying secure.",
      "icon": Icons.quiz,
      "color": Colors.purple,
      "image": "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false, 
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
            ),
              const SizedBox(width: 10),
              const Text('Hello, Mark Lee!'),
          ],
        ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigate to the notification screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notitest()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
      ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjusting the height of the carousel dynamically
              SizedBox(
                height: 230,

                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _carouselSlides.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildCarouselCard(_carouselSlides[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Horizontal list of categories
              SizedBox(
                height: isSmallScreen ? 220 : 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 8),
                    _buildCategoryCard(
                      title: 'SOCIAL\nENGINEERING',
                      color: Colors.orange,
                      icon: Icons.people,
                      imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Phishing',
                      color: Colors.red,
                      icon: Icons.link,
                      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Malware',
                      color: Colors.purple,
                      icon: Icons.bug_report,
                      imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Virus',
                      color: Colors.green,
                      icon: Icons.coronavirus,
                      imageUrl: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Trojan Horse',
                      color: Colors.blue,
                      icon: Icons.visibility,
                      imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Ransomware',
                      color: Colors.teal,
                      icon: Icons.warning,
                      imageUrl: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Adware',
                      color: Colors.pink,
                      icon: Icons.ad_units,
                      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'DDos',
                      color: Colors.deepOrange,
                      icon: Icons.cloud_off,
                      imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Rogue Access Point',
                      color: Colors.indigo,
                      icon: Icons.wifi_find,
                      imageUrl: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    _buildCategoryCard(
                      title: 'Password Cracking',
                      color: Colors.brown,
                      icon: Icons.password,
                      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildInfoCard(
                title: "Security",
                text: "Security isn't just a technology problem! It's a personal responsibility, protect your data and protect your future.",
                icon: Icons.security,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                title: "Threat",
                text: "Every threat is an opportunity to strengthen your defenses! Don't wait for the attack, prepare for it.",
                icon: Icons.warning_amber,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                title: "Social",
                text: "A community forum is where knowledge is shared, ideas are exchanged, and solutions are built together.",
                icon: Icons.forum,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                title: "Quiz",
                text: "Test your knowledge, sharpen your skills! Because in cybersecurity, staying informed is the first step to staying secure.",
                icon: Icons.quiz,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselCard(Map<String, dynamic> slide) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduce horizontal padding if needed
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(slide["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Semi-transparent overlay
            Positioned.fill(
              child: Container(
                color: slide["color"].withOpacity(0.7),
              ),
            ),
            // Content inside the card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Adjust vertical padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
                children: [
                  Icon(slide["icon"] as IconData, size: 40, color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    slide["title"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Make title centered
                  ),
                  const SizedBox(height: 8),
                  Text(
                    slide["text"] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildCategoryCard({
    required String title,
    required Color color,
    required IconData icon,
    String? imageUrl,
    double width = 160,
  }) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              if (imageUrl != null)
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Container(
                color: imageUrl != null ? color.withOpacity(0.7) : color,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 40, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String text,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 14),
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