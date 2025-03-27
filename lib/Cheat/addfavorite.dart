

import 'package:flutter/material.dart';
import './addfuction.dart';

class Notitest1 extends StatelessWidget {
  const Notitest1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(fontFamily: 'SourceSans',fontSize: 40,color: Colors.black,fontWeight: FontWeight.w600,),
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
              notificationText: "Dos & DDos attack: Our community jsut update Dos and DDos attack",
              imagePath: "assets/images/logo.jpg",
            ),
            Container(
              color: Colors.blueGrey[150], // Set background color here
              padding: EdgeInsets.all(16), // Optional padding for better spacing
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30, // Increased size for visibility
                    backgroundImage: AssetImage('assets/images/profile1.jpg'), // Ensure image exists in pubspec.yaml
                  ),
                  SizedBox(height: 10), // Proper spacing
                  Text(
                    'Analyze thread',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.black,size: 30,),
                    title: Text('Add to favorite', style: TextStyle(color: Colors.black)),
                    subtitle: Text('More of your notifications will be like this.'),
                      onTap: () {
                        Navigator.pop(context); // Close the modal
                      },
                  ),
                  ListTile(
                    leading: Icon(Icons.report_problem, color: Colors.black,size: 30,),
                    title: Text('Report issue to account user', style: TextStyle(color: Colors.black)),
                    subtitle: Text('This user account is untrustworthy.'),
                      onTap: () {
                        Navigator.pop(context); // Close the modal
                      }, // Add action
                  ),
                  ListTile(
                    leading: Icon(Icons.block, color: Colors.black,size: 30,),
                    title: Text('Block account', style: TextStyle(color: Colors.black)),
                    subtitle: Text('Remove user account from your community.'),
                      onTap: () {
                        Navigator.pop(context); // Close the modal
                      }, // Add action
                  ),
                  Positioned(
                    right: -10, // Move outside slightly
                    top: -10, // Move to top corner
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the modal
                      },
                      child: Container(
                        width: 35, // Increase size for better clickability
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
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

