import 'dart:async';
import 'package:flutter/material.dart';

class TermAndConditions extends StatefulWidget {
  const TermAndConditions({super.key}); // Fixed constructor name to match class name

  @override
  _TermAndConditionsState createState() => _TermAndConditionsState();
}


class _TermAndConditionsState extends State<TermAndConditions> {  // Fixed the state class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Terms and Conditions",
          style: TextStyle(
            fontSize: 30, // Set font size to 30
          ),
        ),
        backgroundColor: Color.fromARGB(255, 2, 105, 173),
        centerTitle: true, // Center the title
      ),
      body: SingleChildScrollView(  // To allow scrolling if the content overflows
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [            
              Text('Terms and Conditions for Human Firewall ',
                style: TextStyle(
                  color: Color(0xFF494C4E),
                  fontSize: 16,
                  fontFamily: 'Source Serif Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Text('Effective Date: 1st January 2025 ',
                style: TextStyle(
                  color: Color(0xFF0081D7),
                  fontSize: 16,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Please read these Terms and Conditions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: '("Terms") carefully before using the Human Firewall mobile application ("App") operated by G1T3 ("we," "us," or "our"). By accessing or using our App, you agree to be bound by these ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms and Conditions ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'and our ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'If you do not agree to these Terms, you may not use the App.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1. Account Creation and User Obligations',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Eligibility: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' You must be at least 13 years old to use the App. By accessing the App, you represent that you are ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' at least 13 years old ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' or that you have obtained',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' parental consent',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' if required by applicable law.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: '\nAccount Registration:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' To access certain features, you may be required to create an account. You agree to provide accurate, current, and complete information during registration.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: '\nUser Responsibility:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' You are responsible for maintaining the confidentiality of your account credentials and for all activities under your account.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '2. Acceptable Use',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Prohibited Activities:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' You agree not to:\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text:
                          '   - Violate any applicable laws or regulations.\n'
                          '   - Post or share any harmful, defamatory, or illegal\n'
                          '   content.\n'
                          '   - Engage in spamming, phishing, or other fraudulent\n'
                          '   activities.\n'
                          '   - Use the App for any malicious purpose, including\n'
                          '   spreading malware, viruses, or other harmful\n'
                          '   software.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Content Guidelines:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' All posts, comments, and other user-generated content must comply with the Post Guidelines outlined in the App. Violations may result in removal of content or account restrictions.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '3. Intellectual Property',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'App Ownership:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' The App and its content are the property of G1T3 or its licensors and are protected by copyright, trademark, and other intellectual property laws.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'License to Use:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' We grant you a limited, non-exclusive, non-transferable license to access and use the App for personal, non-commercial use, subject to these Terms.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '4. Privacy and Data Collection',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Privacy Policy:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Your use of the App is also governed by our',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' [Privacy Policy]',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ', which outlines how we collect, use, and protect your personal information. By using the App, you consent to our data practices as described in the Privacy Policy.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '5. Termination',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Account Termination:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' We reserve the right to suspend or terminate your account at any time for violations of these Terms or for any other reason deemed necessary, without prior notice.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'User Termination:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' You may deactivate your account at any time by contacting us.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '6. Disclaimers and Limitation of Liability',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'No Warranty:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' The App is provided "as is" and without warranties of any kind, either express or implied. We do not guarantee that the App will be free from errors or interruptions.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Limitation of Liability:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' In no event shall G3T1 be liable for any damages arising out of your use or inability to use the App, including but not limited to loss of data, profits, or personal injury.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '7. Indemnification',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You agree to indemnify, defend, and hold harmless',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' G1T3',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ', its employees, officers, agents, and partners from any claims, losses, liabilities, damages, or expenses arising from your use of the App or any violation of these Terms.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '8. Modifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We may update or modify these Terms at any time. Any changes will be posted on this page, and you will be notified within the App. Your continued use of the App after such changes will constitute your acceptance of the updated Terms.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '9. Contact Us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'If you have any questions about these Terms and Conditions, please contact us at: \n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: 'Email:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' Humanfirewall@gmail.com ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
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
}