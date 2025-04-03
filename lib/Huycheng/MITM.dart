import 'package:flutter/material.dart';

class ManInTheMiddleScreen extends StatelessWidget {
  const ManInTheMiddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManInTheMiddleInfoScreen(); // Directly return the PhishingInfoScreen
  }
}

class ManInTheMiddleInfoScreen extends StatelessWidget {
  const ManInTheMiddleInfoScreen({super.key});

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
              'Man-In-The-Middle',
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
              'MITM',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // What is Phishing Section
            const Text(
              'What is MITM?',
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
                    '• A Man-in-the-Middle (MitM) attack occurs when an attacker intercepts and potentially alters communication between two parties without their knowledge. The attacker can eavesdrop, steal data, or even inject malicious content into the conversation.',
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
              'Scenario: MITM Attack',
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
                    '1. Interception:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The attacker positions themselves between the victim and the intended recipient, often through insecure Wi-Fi networks or by exploiting vulnerabilities in communication protocols (e.g., HTTP instead of HTTPS).',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Eavesdropping or Data Theft:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The attacker can read or capture sensitive information, such as login credentials, credit card numbers, or personal messages, by intercepting the traffic.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3.Data Modification ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'In some cases, the attacker may alter the communication, changing the data being sent or introducing malicious commands.',
                    style: TextStyle(fontSize: 16),
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
                    '1. Use Encrypted Connections (HTTPS):',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '• Always use secure, encrypted protocols (e.g., HTTPS) to prevent attackers from intercepting sensitive data.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Pulic Wi-Fi Precuation',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Avoid conducting sensitive activities (like online banking) over unsecured public Wi-Fi. Use a VPN (Virtual Private Network) to encrypt all your communication.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Verify SSL/TLS Certificates:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Check for valid SSL/TLS certificates when visiting websites to ensure secure communication between you and the site.',
                    style: TextStyle(fontSize:16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '4. Two-Factor Authentication (2FA):',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Even if credentials are intercepted, 2FA adds an additional layer of security, preventing unauthorized access.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '5. Use Strong Authentication:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Implement strong authentication methods, such as digital signatures or client certificates, to prevent unauthorized users from gaining access.',
                    style: TextStyle(fontSize: 16,),
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
