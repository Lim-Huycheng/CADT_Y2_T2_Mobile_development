import 'package:flutter/material.dart';
import './addfuction.dart';

class Notitest extends StatelessWidget {
  const Notitest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        // Allows scrolling by dragging
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: Colors.white,
          title: const Text(
            'Notification',
            style: TextStyle(fontFamily: 'SourceSans', fontSize: 40, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.search, size: 35),
              ),
            ),
          ],
        ),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                buildNotificationCard(
                  title: "Analyze Thread",
                  subtitle: "posted a news",
                  notificationText:
                      "Hello guys !!! Today, I have a really really bad news. New hacker has ...",
                  imagePath: "assets/images/profile1.jpg",
                ),
                buildNotificationCard(
                  title: "Baby analyze",
                  subtitle: "replied your text",
                  notificationText: "Thank you, bro sokhcheat for alert us about this important news",
                  imagePath: "assets/images/profile2.jpg",
                ),
                buildNotificationCard(
                  title: "Human firewall",
                  subtitle: "has update",
                  notificationText: "Dos & DDos attack: Our community just updated about Dos and DDoS attacks.",
                  imagePath: "assets/images/logo.jpg",
                ),
                                buildNotificationCard(
                  title: "CISO cat",
                  subtitle: "replied your text",
                  notificationText: "Implement zero trust and make to yourself on trend!!!",
                  imagePath: "assets/images/profile6.jpg",
                ),
                buildNotificationCard(
                  title: "Human firewall",
                  subtitle: "has update",
                  notificationText: "Every threat is an opportunity to strengthen your defenses! Don't wait for the attack, prepare for it.",
                  imagePath: "assets/images/logo.jpg",
                ),                buildNotificationCard(
                  title: "Baby analyze",
                  subtitle: "replied your text",
                  notificationText: "Don't click on untrust link it make to lost your credential",
                  imagePath: "assets/images/profile2.jpg",
                ),
                buildNotificationCard(
                  title: "I'm a God",
                  subtitle: "posted a news",
                  notificationText: "A dictionary attack is a cybersecurity technique where attackers attempt to crack passwords by systematically trying words from a predefined list, exploiting the human tendency to use common or predictable passwords",
                  imagePath: "assets/images/profile5.png",
                ),
                buildNotificationCard(
                  title: "Human firewall",
                  subtitle: "has update",
                  notificationText: "Phishing is the most common attack by sending fake emails to steal credentials.",
                  imagePath: "assets/images/logo.jpg",
                ),
                buildNotificationCard(
                  title: "Sok Dara",
                  subtitle: "posted a news",
                  notificationText:
                      "I can explain how phishing works in an educational or cybersecurity awareness context, but I cannot create a scenario targeting a specific individual. If you need a general phishing scenario for educational purposes, I can help with that. Let me know how you'd like to proceed!",
                  imagePath: "assets/images/profile4.jpg",
                ),
                buildNotificationCard(
                  title: "CISO cat",
                  subtitle: "replied your text",
                  notificationText: " A ransomware attack is a type of cyberattack where malicious software (malware) encrypts a victim's files or locks their computer, demanding a ransom payment to restore access",
                  imagePath: "assets/images/profile6.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
