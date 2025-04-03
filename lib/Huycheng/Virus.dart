import 'package:flutter/material.dart';

class VirusScreen extends StatelessWidget {
  const VirusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VirusInfoScreen(); // Directly return the PhishingInfoScreen
  }
}

class VirusInfoScreen extends StatelessWidget {
  const VirusInfoScreen({super.key});

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
              'Virus',
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
              'Virus',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // What is Phishing Section
            const Text(
              'What is Virus?',
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
                    '•   Virus is a type of malicious software (malware) that attaches itself to legitimate programs or files. Once executed, it can replicate, spread to other files or systems, and damage or steal data.',
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
              'Scenario: Phishing Email Attack',
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
                    '1. Infected File Download:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'A user unknowingly downloads an infected file (e.g., from an email attachment or unsafe website).',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Execution & Spread:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'When the user opens the file, the virus activates, infecting the system and spreading to other files or devices.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Damage:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'The virus may delete files, steal data, slow down the system, or cause it to crash.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Common Virus Types:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                    
                  ),
                  SizedBox(height: 15),
                  Text(
                    'File Infector: Attaches to executable files and spreads when the file runs.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Macro Virus: Targets documents like Word or Excel using embedded macros.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Boot Sector Virus: Infects the system’s boot sector, activating during startup.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
                    '1. Use Updated Antivirus Software:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '• Regularly scan your system to detect and remove viruses.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '2. Be Cautious with Downloads & Attachments:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Only download files from trusted sources and avoid opening suspicious email attachments.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3. Keep Systems & Software Updated',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Regular updates patch security vulnerabilities that viruses can exploit.',
                    style: TextStyle(fontSize:16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '4. Use Firewalls:',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Enable firewalls to block unauthorized access to your network.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '5. Backup Data Regularly:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Maintain secure backups to restore data if a virus causes damage.',
                    style: TextStyle(fontSize: 16,),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '6. Avoid Using Unknown USB Drives:',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,),
                  ),
                   SizedBox(height: 5),
                  Text(
                    '• Regularly update antivirus and firewall protections to catch malicious links and files.',
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
                    '• Promote awareness about phishing emails and unsafe downloads that often spread viruses.',
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
