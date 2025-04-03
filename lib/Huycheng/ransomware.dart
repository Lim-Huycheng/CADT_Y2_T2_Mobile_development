import 'package:flutter/material.dart';

class RansomwareScreen extends StatelessWidget {
  const RansomwareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RansomwareInfoScreen(); // Directly return the PhishingInfoScreen
  }
}

class RansomwareInfoScreen extends StatelessWidget {
  const RansomwareInfoScreen({super.key});

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
              'Ransomware',
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
              'Ransomware',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // What is Phishing Section
            const Text(
              'What is Ransomware?',
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
                    '• Ransomware is a type of malicious software (malware) that attacker encrypts files and demands payment (ransom) for decryption keys.',
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
              'Scenario: Ransomware',
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
                    '1. Infection:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The user clicks a malicious link, downloads an infected file, or opens a phishing email attachment.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Encryption:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The ransomware silently encrypts files or locks the entire system, making data inaccessible.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Ransom Demand:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'A message appears demanding payment in exchange for a decryption key, often with threats of permanent data loss if unpaid.',
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
                    '1. Use Strong Antivirus & Anti-Malware Software:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '• Regularly scan and update your security tools to detect ransomware threats.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Backup Data Frequently:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Keep offline and cloud backups so data can be restored without paying the ransom.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Be Cautious with Links & Attachments:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Avoid opening suspicious emails, links, or attachments from unknown sources.',
                    style: TextStyle(fontSize:16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '4. Update Systems & Software Regularly:',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Security updates fix vulnerabilities that ransomware can exploit.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '5. Enable Firewalls:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Firewalls help block unauthorized access to networks and devices.',
                    style: TextStyle(fontSize: 16,),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '6.Use Email Filters:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Block malicious emails that might carry ransomware payloads.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '7. Educate Users:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Train users to recognize phishing scams and suspicious behaviors that lead to ransomware infections.',
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
