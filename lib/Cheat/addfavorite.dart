import 'package:flutter/material.dart';
import './addfuction.dart';
import './notifi_cation.dart';


class Notitest1 extends StatefulWidget {
  final String title;
  final String imagePath;

  const Notitest1({
    super.key, 
    required this.title, 
    required this.imagePath
  });

  @override
  State<Notitest1> createState() => _Notitest1State();
}

class _Notitest1State extends State<Notitest1> {
  void _showBlockedMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Blocked user", 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)
          ),
          content: const Text(
            "Are You Sure to Block this User?", 
            style: TextStyle(fontSize: 18)
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel", 
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Notitestification_full()), 
                );
              },
              child: const Text(
                "Continue", 
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showFavoriteMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Add to Favorite", 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)
          ),
          content: const Text(
            "Do you want to add this user to your favorite list?", 
            style: TextStyle(fontSize: 18)
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel", 
                style: TextStyle(
                  fontSize: 17, 
                  color: Colors.lightBlueAccent, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Notitestification_full()), 
                );
              },
              child: const Text(
                "Continue", 
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showReportMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Report Issue", 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)
          ),
          content: const Text(
            "Are you sure you want to report this user for an issue?", 
            style: TextStyle(fontSize: 18)
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel", 
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Notitestification_full()), 
                );
              },
              child: const Text(
                "Continue", 
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600
                ),
              ),
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
        title: const Text(
          'Notification',
          style: TextStyle(
            fontFamily: 'SourceSans', 
            fontSize: 40, 
            color: Colors.black, 
            fontWeight: FontWeight.w600
          ),
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
      body: SingleChildScrollView(
        child: Column(
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
              notificationText: "Thank you, bro sokhcheat for alert us about this important news",
              imagePath: "assets/images/profile2.jpg",
            ),
            buildNotificationCard(
              title: "Human firewall",
              subtitle: "has update",
              notificationText: "Dos & DDos attack: Our community just updated Dos and DDos attack",
              imagePath: "assets/images/logo.jpg",
            ),
            Container(
              color: Colors.blueGrey[150], 
              padding: const EdgeInsets.all(16), 
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), 
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.favorite, 
                      color: Colors.black, 
                      size: 30
                    ),
                    title: const Text(
                      'Add to favorite', 
                      style: TextStyle(color: Colors.black)
                    ),
                    subtitle: const Text('More of your notifications will be like this.'),
                    onTap: _showFavoriteMessage,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.report_problem, 
                      color: Colors.black, 
                      size: 30
                    ),
                    title: const Text(
                      'Report issue to account user', 
                      style: TextStyle(color: Colors.black)
                    ),
                    subtitle: const Text('This user account is untrustworthy.'),
                    onTap: _showReportMessage,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.block, 
                      color: Colors.black, 
                      size: 30
                    ),
                    title: const Text(
                      'Block account', 
                      style: TextStyle(color: Colors.black)
                    ),
                    subtitle: const Text('Remove user account from your community.'),
                    onTap: _showBlockedMessage,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}