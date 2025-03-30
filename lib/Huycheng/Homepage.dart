import 'package:flutter/material.dart';
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
import 'pretexting.dart';
import 'ransomware.dart';
import 'package:human_firewall/Cheat/notifi_cation.dart';
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
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              const SizedBox(width: 16),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.shade700,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Hello, Mark Lee!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
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
              onPressed: () {},
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
                height: 200,
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
          color: Colors.orange,
          icon: Icons.people,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.red,
          icon: Icons.link,
          imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.purple,
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
          color: Colors.orange,
          icon: Icons.people,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.red,
          icon: Icons.link,
          imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.purple,
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
            MaterialPageRoute(builder: (context) => const DosDdosScreen()),
          );
        },
        child: _buildCategoryCard(
          title: 'Dos&Ddos',
          color: Colors.orange,
          icon: Icons.people,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.red,
          icon: Icons.link,
          imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          color: Colors.purple,
          icon: Icons.bug_report,
          imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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


  Widget _buildQuickAction({
    required IconData icon,
    required Color color,
    required String label,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(height: 8),
              Text(label, textAlign: TextAlign.center),
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




