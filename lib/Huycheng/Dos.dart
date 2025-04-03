import 'package:flutter/material.dart';

class DdosScreen extends StatelessWidget {
  const DdosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DdosInfoScreen(); // Directly return the PhishingInfoScreen
  }
}

class DdosInfoScreen extends StatelessWidget {
  const DdosInfoScreen({super.key});

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
              'Phishing Awareness',
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
        leading: IconButton(
          padding: const EdgeInsets.only(top: 10),
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Added color for visibility
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const Text(
              'Phishing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // What is Phishing Section
            const Text(
              'What is DoS & DDoS?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• A DoS attack, much like a DDoS attack, aims to make a target system or network resource unavailable by overwhelming it with excessive requests. However, in DoS, the attack is initiated from a single source, whereas DDoS involves multiple sources (often a botnet).',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Divider
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            
            // Scenarios Section
            const Text(
              'Scenarios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Scenario: Dos and Ddos Attack',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Single Point of Failure:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'In a typical DoS attack, one device or attacker floods a target server with traffic. The server cannot handle the overload, and services become disrupted or completely unavailable.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. In DDoS Context:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The attacker can control multiple machines, often using a botnet, to initiate a DoS-like attack from various locations simultaneously, creating a much larger and more difficult-to-mitigate flood of traffic.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const Text(
              'Prevention Methods:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    '1. DDoS Protection Services:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '• Use specialized services like Cloudflare, AWS Shield, or Akamai to mitigate large-scale traffic floods that are typical in DDoS attacks.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Rate Limiting:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• While this is effective for smaller-scale DoS attacks, in DDoS contexts, applying rate-limiting across multiple servers or points of entry helps reduce traffic overload.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Traffic Filtering & Analysis:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Advanced systems can detect patterns indicative of a DoS (or DDoS) attack and block malicious traffic in real time before it reaches the target.',
                    style: TextStyle(fontSize:16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '4. Use of Redundant Networks and Servers:',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• With DDoS, leveraging multiple servers or data centers ensures that traffic is distributed evenly, and even if one server is attacked, others can handle the load.',
                    style: TextStyle(fontSize: 16),
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
