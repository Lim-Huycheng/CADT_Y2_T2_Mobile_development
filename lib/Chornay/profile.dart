import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/welcome.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.blue.shade700,
              backgroundImage: NetworkImage(
                  'https://img.icons8.com/?size=100&id=WyivBeZwTRk6&format=png&color=000000'),
            ),
            SizedBox(height: 30),
            // Name
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            // Job Title
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueGrey[600],
              ),
            ),
            SizedBox(height: 20),
            // Bio Section
            Text(
              'Passionate about software development and solving real-world problems.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 25),
            // Email Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.blue.shade700),
                SizedBox(width: 10),
                Text('john.doe@example.com',
                    style: TextStyle(fontSize: 18, color: Colors.black54)),
              ],
            ),
            SizedBox(height: 20),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            // App Version Info
            Text(
              'App Version 1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 25),
            // Settings Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.grey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Language'),
              subtitle: Text('English'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Language change
              },
            ),
            ListTile(
              title: Text('Notifications'),
              subtitle: Text('Enabled'),
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  // Handle Notification toggle
                },
              ),
            ),
            ListTile(
              title: Text('Privacy Settings'),
              subtitle: Text('Public'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Privacy settings
              },
            ),
            ListTile(
              title: Text('Account Settings'),
              subtitle: Text('Manage account details'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Account Settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
