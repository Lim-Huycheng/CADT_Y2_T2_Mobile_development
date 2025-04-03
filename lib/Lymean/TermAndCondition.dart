import 'package:flutter/material.dart';

class TermAndConditions extends StatefulWidget {
  const TermAndConditions({super.key}); // Fixed constructor name to match class name

  @override
  _TermAndConditionsState createState() => _TermAndConditionsState();
}

TextStyle boldTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Source Sans Pro',
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
}

TextStyle normalTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Source Sans Pro',
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
}

TextStyle pointTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontFamily: 'Source Sans Pro',
    fontWeight: FontWeight.w700,
  );
}

class _TermAndConditionsState extends State<TermAndConditions> {  // Fixed the state class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0081D7),
        title: null,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: const Text(
              'Terms & condition',
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
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
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' ("Terms") carefully before using the Human Firewall mobile application ("App") operated by G1T3 ("we," "us," or "our"). By accessing or using our App, you agree to be bound by these ',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'Terms and Conditions ',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: 'and our ',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'Privacy Policy. ',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: 'If you do not agree to these Terms, you may not use the App.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1. Account Creation and User Obligations',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Eligibility: ',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' You must be at least 13 years old to use the App. By accessing the App, you represent that you are ',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: ' at least 13 years old ',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' or that you have obtained',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: ' parental consent',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' if required by applicable law.',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: '\nAccount Registration:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' To access certain features, you may be required to create an account. You agree to provide accurate, current, and complete information during registration.',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: '\nUser Responsibility:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' You are responsible for maintaining the confidentiality of your account credentials and for all activities under your account.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '2. Acceptable Use',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Prohibited Activities:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' You agree not to:\n',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text:
                          '   - Violate any applicable laws or regulations.\n'
                          '   - Post or share any harmful, defamatory, or illegal content.\n'
                          '   - Engage in spamming, phishing, or other fraudulent activities.\n'
                          '   - Use the App for any malicious purpose, including spreading malware, viruses, or other harmful software.\n',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'Content Guidelines:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' All posts, comments, and other user-generated content must comply with the Post Guidelines outlined in the App. Violations may result in removal of content or account restrictions.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '3. Intellectual Property',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'App Ownership:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' The App and its content are the property of G1T3 or its licensors and are protected by copyright, trademark, and other intellectual property laws.\n',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'License to Use:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' We grant you a limited, non-exclusive, non-transferable license to access and use the App for personal, non-commercial use, subject to these Terms.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '4. Privacy and Data Collection',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Privacy Policy:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' Your use of the App is also governed by our',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: ' [Privacy Policy]',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ', which outlines how we collect, use, and protect your personal information. By using the App, you consent to our data practices as described in the Privacy Policy.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '5. Termination',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Account Termination:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' We reserve the right to suspend or terminate your account at any time for violations of these Terms or for any other reason deemed necessary, without prior notice.\n',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'User Termination:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' You may deactivate your account at any time by contacting us.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '6. Disclaimers and Limitation of Liability',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'No Warranty:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' The App is provided "as is" and without warranties of any kind, either express or implied. We do not guarantee that the App will be free from errors or interruptions.\n',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'Limitation of Liability:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' In no event shall G3T1 be liable for any damages arising out of your use or inability to use the App, including but not limited to loss of data, profits, or personal injury.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '7. Indemnification',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You agree to indemnify, defend, and hold harmless',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: ' G1T3',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ', its employees, officers, agents, and partners from any claims, losses, liabilities, damages, or expenses arising from your use of the App or any violation of these Terms.',
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '8. Modifications',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              Text(
                'We may update or modify these Terms at any time. Any changes will be posted on this page, and you will be notified within the App. Your continued use of the App after such changes will constitute your acceptance of the updated Terms.',
                style: normalTextStyle(),
              ),
              SizedBox(height: 10),
              Text(
                '9. Contact Us',
                style: pointTextStyle(),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'If you have any questions about these Terms and Conditions, please contact us at: \n',
                      style: normalTextStyle(),
                    ),
                    TextSpan(
                      text: 'Email:',
                      style: boldTextStyle(),
                    ),
                    TextSpan(
                      text: ' Humanfirewall@gmail.com ',
                      style: normalTextStyle(),
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