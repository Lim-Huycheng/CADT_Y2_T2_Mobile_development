
import 'package:flutter/material.dart';
import './addfuction.dart';


class Notitest extends StatelessWidget {
  const Notitest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(fontFamily: 'Source Sans Pro'),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
        body: Column(
          children: [
            buildNotificationCard(
              title: "Analyze Thread",
              subtitle: "posted a news",
              notificationText:
                  "Hello guys !!! Today, I have a really really bad news. New hacker has ...",
              imagePath: "assets/pic2.jpg",
            ),
            buildNotificationCard(
              title: "Baby analyze",
              subtitle: "replied your text",
              notificationText: "Thank you, bro sokhcheat for alert us about this important news",
              imagePath: "assets/pic1.jpg",
            ),
            buildNotificationCard(
              title: "Human firewall",
              subtitle: "has update",
              notificationText: "Dos & DDos attack: Our community jsut update Dos and DDos attack",
              imagePath: "assets/pic1.jpg",
            ),
            buildNotificationCard(
              title: "Human firewall",
              subtitle: "has update",
              notificationText: "Phishing is the most attack by sending fake email to steal credential.",
              imagePath: "assets/pic1.jpg",
            ),
            buildNotificationCard(
              title: "Analyze Thread",
              subtitle: "posted a news",
              notificationText:
                  "FBI has found a new technique about Ransomware. So everyone, ...",
              imagePath: "assets/pic2.jpg",
            ),
            buildNotificationCard(
              title: "Baby analyze",
              subtitle: "replied your text",
              notificationText: "Really !!!!!!!! It is so scary",
              imagePath: "assets/pic1.jpg",
            ),
          ],
        ),
      
      ),
    );
  }
}
