import 'package:flutter/material.dart';
import './addfuction.dart';
import './show_history.dart';

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
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Showhistory(),
                      ),
                    ); // Closing bracket added here
                    // Add functionality to load previous notifications if needed
                  },
                    child: const Text("See previous notifications"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
