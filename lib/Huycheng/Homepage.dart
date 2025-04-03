import 'package:flutter/material.dart';
import 'package:human_firewall/Chornay/Profile.dart';
import 'dart:async';
import 'phishing.dart';
import 'Vishing.dart';
import 'Smishing.dart';
import 'pretexting.dart';
import 'Virus.dart';
import 'trojanhorse.dart';
import 'Adware.dart';
import 'Dos.dart';
import 'MITM.dart';
import 'Rogue _AP.dart';
import 'ransomware.dart';
import 'package:human_firewall/Cheat/noti.dart';
import 'pw_cracking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  late Timer _carouselTimer;
  int _currentPage = 0;
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _startCarouselAutoSlide();
  }

  void _startCarouselAutoSlide() {
    _carouselTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
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
    _searchController.dispose();
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
    return WillPopScope(
       onWillPop: () async {
    // Optionally show a message
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Back button disabled')));
      return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue.shade700,
                backgroundImage: NetworkImage(
                    'https://img.icons8.com/?size=100&id=WyivBeZwTRk6&format=png&color=000000'),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()), // Change this to your desired screen
                  );
                },
                child: const Text(
                  'Hello, Mark Lee!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              iconSize: 20,
              color: Colors.blueGrey.shade700,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Notitest()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 20, 
              color: Colors.blueGrey.shade700, 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(isSmallScreen ? 16.0 : 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for phishing,ransomware, etc...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, 
                        horizontal: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 10),
              
              // Carousel Section
              SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _carouselSlides.length,
                  itemBuilder: (context, index) {
                    return _buildCarouselCard(_carouselSlides[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              // Social Engineering Section
              const Text(
                'Social Engineering',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: isSmallScreen ? 220 : 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PhishingScreen()),
                          );
                      },
                      
        child: _buildCategoryCard(
          title: 'Phshing',
          // color: Colors.orange,
          icon: Icons.people,
          imageUrl: 'https://cdn.pixabay.com/photo/2018/05/11/12/59/phishing-3390518_1280.jpg',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VishingScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Vishing',
          // color: Colors.red,
          icon: Icons.link,
          imageUrl: 'https://timely-benefit-e63d540317.media.strapiapp.com/Picture_1_Phishing_vs_Vishing_vs_Smishing_Key_Differences_a2c88f0733.jpg',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SmishingScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Pretexting',
          // color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtlUFQd_3TtVsaKsY6C3rtfpUtpljWFqrhZA&s',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PretextingScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Smishing',
          // color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        ),
      ),
    ],
  ),
),
const SizedBox(height: 20),
const Text(
    'Malware',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
// Malware Section
SizedBox(
  height: isSmallScreen ? 220 : 250,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VirusScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Virus',
          // color: Colors.orange,
          icon: Icons.people,
          imageUrl: 'https://images.unsplash.com/photo-1620825937374-87fc7d6bddc2?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TrojanHorseScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Trojan Horse',
          // color: Colors.red,
          icon: Icons.link,
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS7UDo0V6pClRGklnvosxyArKFvO2ERuiK4w&s',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RansomwareScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Ransomware',
          // color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1618060932014-4deda4932554?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdwareScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Adware',
          // color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        ),
      ),
    ],
  ),
),
const SizedBox(height: 20),
const Text(
    'Network Attacks',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
// Network Attacks Section
SizedBox(
  height: isSmallScreen ? 220 : 250,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DdosScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Dos&Ddos',
          // color: Colors.orange,
          icon: Icons.people,
          imageUrl: 'https://images.unsplash.com/photo-1504203700686-f21e703e5f1c?q=80&w=2083&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RogueAccessPointScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Rogue Access Point',
          // color: Colors.red,
          icon: Icons.link,
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIRFu4Zi9NVum29SmKcCepVN4ATCll3o4Z8Q&s',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ManInTheMiddleScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Man In The Middle',
          // color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://discover.strongdm.com/hubfs/main-in-the-middle-attack-mitm.jpg',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PasswordCrackingScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Password Cracking',
          // color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1504203700686-f21e703e5f1c?q=80&w=2083&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ),
    ],
  ),
),
              const SizedBox(height: 20),
              
              // Recent Activities Section
              const Text(
                'Recent Activities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildActivityItem(
                        icon: Icons.security,
                        title: 'New Andrios trojan Crocodilus Abuses Accessibility to Steal Banking and Ctypto Credentials',
                        subtitle: 'Threat Intellogence/Mobile Security',
                        time: '2 hours ago'
                      ),
                      const Divider(),
                      _buildActivityItem(
                        icon: Icons.assignment_turned_in,
                        title: 'BlockLock Ransomware Exposed After Reseachers Exploit Leak Site Vulnerability',
                        subtitle: 'Cybercrime / vulnerability',
                        time: 'Yesterday'
                      ),
                      const Divider(),
                      _buildActivityItem( 
                        icon: Icons.update,
                        title: 'CoffeeLoader Uses GPU-Based Armyoury Packer to Evade EDR and Antirus Detection',
                        subtitle: 'Endpoint Security/Threat Intelligence',
                        time: '2 days ago'
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCarouselCard(Map<String, dynamic> slide) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9, // Responsive width
        child: Stack(
          children: [
            // Image with proper scaling
            Image.network(
              slide["image"],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
            ),
            // Color overlay
            Container(
              color: slide["color"].withOpacity(0.7),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(slide["icon"] as IconData, 
                      size: 40, 
                      color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    slide["title"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      slide["text"] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
      clipBehavior: Clip.antiAlias, // Ensure clean clipping of the image
      child: Stack(
        children: [
          // Image background
          if (imageUrl != null)
            SizedBox.expand( // Forces the image to expand to fill available space
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // Cover the entire space while maintaining aspect ratio
                alignment: Alignment.center, // Center the image
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300], // Fallback if image fails to load
                ),
              ),
            ),
          // Gradient overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Content
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
  );
}

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(time, style: TextStyle(color: Colors.grey[600])),
      contentPadding: EdgeInsets.zero,
    );
  }
}