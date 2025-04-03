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
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Vishing',
      'screen': const VishingScreen(),
      'image': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Smishing',
      'screen': const SmishingScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Pretexting',
      'screen': const PretextingScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Virus',
      'screen': const VirusScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Trojan Horse',
      'screen': const TrojanHorseScreen(),
      'image': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Adware',
      'screen': const AdwareScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Denial of Service (DoS)',
      'screen': const DdosScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Man-in-the-Middle (MITM)',
      'screen': const ManInTheMiddleScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Rogue Access Point',
      'screen': const RogueAccessPointScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Ransomware',
      'screen': const RansomwareScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Password Cracking',
      'screen': const PasswordCrackingScreen(),
      'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
