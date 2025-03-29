import 'package:flutter/material.dart';
import './addfuction.dart';
import './notifi_cation.dart';

class Notitest1 extends StatefulWidget {
  const Notitest1({super.key});

  @override
  State<Notitest1> createState() => _Notitest1State();
}

    class _Notitest1State extends State<Notitest1> { 
    void _showBlockedMessage() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Blocked user", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,)),
            content: const Text("Are You Sure to Block this User?", style: TextStyle(fontSize: 18,)),
            actions: [
              TextButton(
                onPressed: () {
                  
                  Navigator.pop(context); 
                },
                child: const Text("Cancel", style: TextStyle(fontSize: 17,color: Colors.lightBlueAccent,fontWeight: FontWeight.w600,)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Notitest()), 
                  );
                },
                child: const Text("Continue", style: TextStyle(fontSize: 17,color: Colors.lightBlueAccent,fontWeight: FontWeight.w600,)),
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
            title: const Text("Add to Favorite", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            content: const Text("Do you want to add this user to your favorite list?", style: TextStyle(fontSize: 18)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel", style: TextStyle(fontSize: 17, color: Colors.lightBlueAccent, fontWeight: FontWeight.w600)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Notitest()), 
                  );
                },
                child: const Text("Continue", style: TextStyle(fontSize: 17, color: Colors.lightBlueAccent, fontWeight: FontWeight.w600)),
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
            title: const Text("Report Issue", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            content: const Text("Are you sure you want to report this user for an issue?", style: TextStyle(fontSize: 18)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel", style: TextStyle(fontSize: 17, color: Colors.lightBlueAccent, fontWeight: FontWeight.w600)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Notitest()), 
                  );
                },
                child: const Text("Continue", style: TextStyle(fontSize: 17, color: Colors.lightBlueAccent, fontWeight: FontWeight.w600)),
              ),
            ],
          );
        },
      );
    }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(fontFamily: 'SourceSans', fontSize: 40, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
        body: SingleChildScrollView(  
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
                notificationText: "Dos & DDos attack: Our community just updated Dos and DDos attack",
                imagePath: "assets/images/logo.jpg",
              ),
              Container(
                color: Colors.blueGrey[150], 
                padding: const EdgeInsets.all(16), 
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 30, 
                      backgroundImage: AssetImage('assets/images/profile1.jpg'), 
                    ),
                    const SizedBox(height: 10), 
                    const Text(
                      'Analyze thread',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.black, size: 30),
                      title: const Text('Add to favorite', style: TextStyle(color: Colors.black)),
                      subtitle: const Text('More of your notifications will be like this.'),
                      onTap: () {
                        _showFavoriteMessage(); 
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.report_problem, color: Colors.black, size: 30),
                      title: const Text('Report issue to account user', style: TextStyle(color: Colors.black)),
                      subtitle: const Text('This user account is untrustworthy.'),
                      onTap: () {
                        _showReportMessage() ;
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.block, color: Colors.black, size: 30),
                      title: const Text('Block account', style: TextStyle(color: Colors.black)),
                      subtitle: const Text('Remove user account from your community.'),
                      onTap: () {
                        _showBlockedMessage(); // Show blocked message
                      },
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
      ),
    );
  }
}
