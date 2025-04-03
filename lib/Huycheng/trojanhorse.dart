import 'package:flutter/material.dart';

class TrojanHorseScreen extends StatelessWidget {
  const TrojanHorseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TrojanHorseInfoScreen(); // Directly return the PhishingInfoScreen
  }
}

class TrojanHorseInfoScreen extends StatelessWidget {
  const TrojanHorseInfoScreen({super.key});

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
              'trojan Horse',
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
              'Trojan Horse',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // What is Phishing Section
            const Text(
              'What is Trojan Horse?',
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
                    '• A Trojan horse (or simply "Trojan") is a type of malware that disguises itself as a legitimate or useful program to trick users into downloading and executing it. Once activated, it can perform a variety of harmful actions, such as stealing data, allowing unauthorized access, or damaging the system.',
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
              'Disguised as a Legitimate Program:',
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
                    '1. Disguised as a Legitimate Program',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The Trojan appears to be a harmless file or software, often appearing as a game, utility, or update. The user is tricked into downloading and installing it, believing it to be safe.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Activation and Malicious Behavior:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Once activated, the Trojan may perform a variety of harmful activities, such as stealing personal information, downloading additional malware, or opening backdoors to give attackers control over the infected system.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Silent Operation:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Many Trojans are designed to operate quietly in the background, making them difficult to detect and allowing them to continue to cause damage without the user\'s knowledge.',
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
                    '1. Download Software Only from Trusted Sources:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '• Avoid downloading software from unverified or suspicious websites, and always ensure that files come from official, trusted sources.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Antivirus and Anti-Malware Software:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Use antivirus and anti-malware software to detect and remove Trojans before they can cause harm. Make sure the software is updated regularly.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Enable Firewalls',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Use a firewall to monitor and block unauthorized traffic to and from your system, making it harder for Trojans to communicate with external servers.',
                    style: TextStyle(fontSize:16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '4. Be Cautious with Email Attachments and Links:',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Avoid opening email attachments or clicking on links from unknown or suspicious sources. These are common delivery methods for Trojans.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '5. Regular System and Software Updates:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Keep your operating system and software up to date with the latest security patches to minimize vulnerabilities that Trojans may exploit.',
                    style: TextStyle(fontSize: 16,),
                  ),
                 
                  SizedBox(height: 15),
                  Text(
                    '6. Use Sandboxing for Unknown Software:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                  Text(
                    '• Run untrusted or unknown programs in a sandbox environment to isolate them from the rest of your system, preventing potential harm.',
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
