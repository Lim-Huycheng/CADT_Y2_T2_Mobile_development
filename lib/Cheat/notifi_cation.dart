import 'package:flutter/material.dart';
import './addfuction.dart';

class Notitest extends StatelessWidget {
  const Notitest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80), // Increased height
          child: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0, // Removes shadow for a clean look
            title: const Padding(
              padding: EdgeInsets.only(bottom: 10), // Moves title lower
              child: Text(
                'Notification',
                style: TextStyle(
                  fontFamily: 'SourceSans',
                  fontSize: 30, // Adjusted for better fit
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            centerTitle: true, // Centers the title
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                  title: "Human firewall",
                  subtitle: "has update",
                  notificationText: "Phishing is the most common attack by sending fake emails to steal credentials.",
                  imagePath: "assets/images/logo.jpg",
                ),
                buildNotificationCard(
                  title: "Analyze Thread",
                  subtitle: "posted a news",
                  notificationText:
                      "FBI has found a new technique about Ransomware. So everyone, ...",
                  imagePath: "assets/images/profile1.jpg",
                ),
                buildNotificationCard(
                  title: "Baby analyze",
                  subtitle: "replied your text",
                  notificationText: "Really !!!!!!!! It is so scary",
                  imagePath: "assets/images/profile2.jpg",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
