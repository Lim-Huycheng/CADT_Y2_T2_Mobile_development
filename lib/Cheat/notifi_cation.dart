import 'package:flutter/material.dart';
import './addfuction.dart';
import './show_history.dart';
class Notitestification_full extends StatelessWidget {
  const Notitestification_full({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Notification',
            style: TextStyle(
              fontFamily: 'SourceSans',
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
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
              notificationText: "Hello guys !!! Today, I have a really really bad news. New hacker has ...",
              imagePath: "assets/images/profile1.jpg",
            ),
            buildNotificationCard(
              title: "Baby analyze",
              subtitle: "replied your text",
              notificationText: "Thank you, bro sokhcheat for alerting us about this important news",
              imagePath: "assets/images/profile2.jpg",
            ),
            buildNotificationCard(
              title: "Human firewall",
              subtitle: "has update",
              notificationText: "Dos & DDos attack: Our community just updated about Dos and DDoS attacks.",
              imagePath: "assets/images/logo.jpg",
            ),
            buildNotificationCard(
              title: "Analyze Thread",
              subtitle: "posted a news",
              notificationText: "FBI has found a new technique about Ransomware. So everyone, ...",
              imagePath: "assets/images/profile1.jpg",
            ),
            buildNotificationCard(
              title: "Baby analyze",
              subtitle: "replied your text",
              notificationText: "Really !!!!!!!! It is so scary",
              imagePath: "assets/images/profile2.jpg",
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notitest(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text("See previous notifications"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
