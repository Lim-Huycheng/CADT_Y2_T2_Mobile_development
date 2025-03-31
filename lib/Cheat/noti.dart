import 'package:flutter/material.dart';

class Notitest extends StatefulWidget {
  const Notitest({super.key});

  @override
  State<Notitest> createState() => _NotitestState();
}

class _NotitestState extends State<Notitest> {
  List<Map<String, dynamic>> notifications = [
    {
      "title": "Analyze Thread",
      "subtitle": "posted a news",
      "notificationText": "Phishing attacks have become increasingly sophisticated, targeting individuals to steal sensitive information. To protect yourself, always verify the source of suspicious emails or messages, and avoid clicking on unknown links. Be cautious of mismatched URLs, as attackers often use fake sites to steal data. Enable multi-factor authentication (MFA) for added security, and regularly update your software to patch vulnerabilities. Use anti-phishing tools to detect threats, and educate yourself and others about common phishing tactics. Staying vigilant is the key to safeguarding your information against these attacks.",
      "imagePath": "assets/images/profile1.jpg",
      "username": "John Doe",
      "isFavorite": false
    },
    {
      "title": "Baby analyze",
      "subtitle": "replied your text",
      "notificationText": "Thank you, bro sokhcheat for alerting us...",
      "imagePath": "assets/images/profile2.jpg",
      "username": "Jane Smith",
      "isFavorite": false
    },
    {
      "title": "Human firewall",
      "subtitle": "has updated",
      "notificationText": "Dos & DDoS attack: New update!",
      "imagePath": "assets/images/logo.jpg",
      "username": "Admin",
      "isFavorite": false
    },
    {
      "title": "Security Alert",
      "subtitle": "posted an alert",
      "notificationText": "A new vulnerability has been discovered in the system, please update your software immediately.",
      "imagePath": "assets/images/profile3.jpg",
      "username": "Security Team",
      "isFavorite": false
    },
    {
      "title": "New Features",
      "subtitle": "updated the system",
      "notificationText": "Check out the new features in the latest update! We’ve improved the user interface and added new functionalities.",
      "imagePath": "assets/images/profile4.jpg",
      "username": "Tech Team",
      "isFavorite": false
    },
    {
      "title": "Urgent Update",
      "subtitle": "requires your attention",
      "notificationText": "Please review the critical updates and install the patches as soon as possible.",
      "imagePath": "assets/images/profile5.jpg",
      "username": "Admin",
      "isFavorite": false
    },
    {
      "title": "System Maintenance",
      "subtitle": "scheduled maintenance",
      "notificationText": "Scheduled maintenance will take place from 12 AM to 3 AM. Expect temporary service disruptions during this time.",
      "imagePath": "assets/images/profile6.jpg",
      "username": "Maintenance Team",
      "isFavorite": false
    },
    {
      "title": "Security Tip",
      "subtitle": "shared a tip",
      "notificationText": "Always use strong passwords and avoid reusing passwords across different sites. Enable multi-factor authentication for additional security.",
      "imagePath": "assets/images/profile7.jpg",
      "username": "John Doe",
      "isFavorite": false
    },
    {
      "title": "Account Notification",
      "subtitle": "your account was accessed",
      "notificationText": "We noticed a login from a new device. If this wasn't you, please secure your account immediately.",
      "imagePath": "assets/images/profile8.jpg",
      "username": "Security",
      "isFavorite": false
    },
    {
      "title": "Reminder",
      "subtitle": "reminder set",
      "notificationText": "Don't forget to change your password in the next 30 days as part of our security protocol.",
      "imagePath": "assets/images/profile9.jpg",
      "username": "Admin",
      "isFavorite": false
    },
  ];

  void blockUser(int index) {
    if (index >= 0 && index < notifications.length) {
      setState(() {
        notifications.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User blocked successfully.")),
      );
    }
  }

  void toggleFavorite(int index) {
    if (index >= 0 && index < notifications.length) {
      setState(() {
        notifications[index]['isFavorite'] = !notifications[index]['isFavorite'];
      });
    }
  }

  void reportUser(String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Report User",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Are you sure you want to report $username for inappropriate behavior?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$username has been reported."),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      },
                      child: const Text(
                        "Report",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showPostDetails(int index) {
    var item = notifications[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(item['imagePath']),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(item['username'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Posted: ${item['subtitle']}", style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 15),
                Text(
                  item['notificationText'],
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0081D7),
        title: null,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: const Text(
              'Notification',
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
      ),
      body: SafeArea(
        child: notifications.isEmpty
            ? const Center(
                child: Text(
                  "No notifications available",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  var item = notifications[index];
                  return buildNotificationCard(
                    index: index,
                    title: item['title'],
                    subtitle: item['subtitle'],
                    notificationText: item['notificationText'],
                    imagePath: item['imagePath'],
                    username: item['username'],
                    isFavorite: item['isFavorite'],
                  );
                },
              ),
      ),
    );
  }

  Widget buildNotificationCard({
    required int index,
    required String title,
    required String subtitle,
    required String notificationText,
    required String imagePath,
    required String username,
    required bool isFavorite,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 5,
      shadowColor: Colors.grey.shade500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(
          notificationText,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black54),
        ),
        onTap: () {
          showPostDetails(index);
        },
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'favorite') toggleFavorite(index);
            if (value == 'block') blockUser(index);
            if (value == 'report') reportUser(username);
          },
          itemBuilder: (BuildContext context) {
            List<PopupMenuEntry<String>> options = [
              PopupMenuItem<String>(
                value: 'favorite',
                child: Row(
                  children: [
                    Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite ? Colors.yellow : Colors.black54,
                    ),
                    const SizedBox(width: 10),
                    Text(isFavorite ? "Unfavorite" : "Add to Favorite"),
                  ],
                ),
              ),
            ];

            if (username != "Admin") {
              options.addAll([
                PopupMenuItem<String>(
                  value: 'block',
                  child: const Row(
                    children: [
                      Icon(Icons.block, color: Colors.red),
                      SizedBox(width: 10),
                      Text("Block User"),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'report',
                  child: const Row(
                    children: [
                      Icon(Icons.report, color: Colors.orange),
                      SizedBox(width: 10),
                      Text("Report Issue"),
                    ],
                  ),
                ),
              ]);
            }
            return options;
          },
        ),
      ),
    );
  }
}
