import 'package:flutter/material.dart';
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
import 'pw_cracking.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _categoryList = [
    {
      'title': 'Phishing',
      'screen': const PhishingScreen(),
      'image': 'https://cdn.pixabay.com/photo/2018/05/11/12/59/phishing-3390518_1280.jpg',
    },
    {
      'title': 'Vishing',
      'screen': const VishingScreen(),
      'image': 'https://timely-benefit-e63d540317.media.strapiapp.com/Picture_1_Phishing_vs_Vishing_vs_Smishing_Key_Differences_a2c88f0733.jpg',
    },
    {
      'title': 'Smishing',
      'screen': const SmishingScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Pretexting',
      'screen': const PretextingScreen(),
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtlUFQd_3TtVsaKsY6C3rtfpUtpljWFqrhZA&s',
    },
    {
      'title': 'Virus',
      'screen': const VirusScreen(),
      'image': 'https://images.unsplash.com/photo-1620825937374-87fc7d6bddc2?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Trojan Horse',
      'screen': const TrojanHorseScreen(),
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS7UDo0V6pClRGklnvosxyArKFvO2ERuiK4w&s',
    },
    {
      'title': 'Adware',
      'screen': const AdwareScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Denial of Service (DoS)',
      'screen': const DdosScreen(),
      'image': 'https://images.unsplash.com/photo-1504203700686-f21e703e5f1c?q=80&w=2083&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Man-in-the-Middle (MITM)',
      'screen': const ManInTheMiddleScreen(),
      'image': 'https://discover.strongdm.com/hubfs/main-in-the-middle-attack-mitm.jpg',
    },
    {
      'title': 'Rogue Access Point',
      'screen': const RogueAccessPointScreen(),
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIRFu4Zi9NVum29SmKcCepVN4ATCll3o4Z8Q&s',
    },
    {
      'title': 'Ransomware',
      'screen': const RansomwareScreen(),
      'image': 'https://images.unsplash.com/photo-1618060932014-4deda4932554?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'title': 'Password Cracking',
      'screen': const PasswordCrackingScreen(),
      'image': 'https://images.unsplash.com/photo-1504203700686-f21e703e5f1c?q=80&w=2083&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  List<Map<String, dynamic>> _filteredCategoryList = [];
  FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _filteredCategoryList = _categoryList;
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  void _filterCategories(String query) {
    setState(() {
      _filteredCategoryList = _categoryList.where((category) {
        return category['title']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  // Clear search input when the "X" button is pressed
  void _clearSearch() {
    _searchController.clear();
    _filterCategories('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0081D7),
        title: null,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: const Text(
              'Search Categories',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSerif',
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search input field with a stylish design
            TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search categories...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.blue),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: _clearSearch, // Clear the search input
                      )
                    : null,
              ),
              onChanged: _filterCategories,
            ),
            const SizedBox(height: 20),
            // Display filtered categories
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _filteredCategoryList.length,
                itemBuilder: (context, index) {
                  var category = _filteredCategoryList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => category['screen']),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.network(
                              category['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Text(
                                category['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  backgroundColor: Colors.black45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
