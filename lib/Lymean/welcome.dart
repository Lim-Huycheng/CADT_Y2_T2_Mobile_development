import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/homescreen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // Ensuring proper centering
        decoration: BoxDecoration(
          color: Colors.white,  // Set the background color here
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Container for the logo image with 350x350 size
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
              ),
            ),
            const HumanFirewall(),
            const SizedBox(height: 20),
            const LetSLearnToProtectOurselves(),
            const SizedBox(height: 20),
            const Frame1(),
            const SizedBox(height: 70),
            const LicenseByCiscoOwnedByG1t3(),
          ],
        ),
      ),
    );
  }
}

class HumanFirewall extends StatelessWidget {
  const HumanFirewall({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 401,
          child: Text(
            'Human Firewall',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0081D7),
              fontSize: 48,
              fontFamily: 'SourceSerif',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class Frame1 extends StatelessWidget {
  const Frame1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0081D7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(134, 50),
      ),
      onPressed: () {
        // Navigate to the second page when the button is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CombinedGroup()),
        );
      },
      child: const Text(
        'Get Started',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'SuezOne',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<String> searchSuggestions = [
    'Phishing Attacks',
    'Malware Prevention',
    'Two-Factor Authentication',
    'Social Engineering',
    'Online Privacy Tips'
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null), // Closes search bar
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clears search text
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Results for: "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = searchSuggestions.where(
      (suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()),
    ).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}

class LetSLearnToProtectOurselves extends StatelessWidget {
  const LetSLearnToProtectOurselves({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Let’s Learn\nHow To Protect Ourselves',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 24,
            fontFamily: 'SourceSans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class LicenseByCiscoOwnedByG1t3 extends StatelessWidget {
  const LicenseByCiscoOwnedByG1t3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          '© 2025 G1T3. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF0081D7),
            fontSize: 14,
            fontFamily: 'SourceSans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
