import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/welcome.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = 'john.doe@example.com'; // Make email mutable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: ProfileCard(
          email: email,
          onEmailChanged: _updateEmail,
        ),
      ),
    );
  }

  void _updateEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }
}

class ProfileCard extends StatelessWidget {
  final String email;
  final Function(String) onEmailChanged;

  ProfileCard({required this.email, required this.onEmailChanged});

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
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.blue.shade700,
              backgroundImage: NetworkImage(
                  'https://img.icons8.com/?size=100&id=WyivBeZwTRk6&format=png&color=000000'),
            ),
            SizedBox(height: 30),
            Text('John Doe', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Software Engineer', style: TextStyle(fontSize: 22, color: Colors.blueGrey[600])),
            SizedBox(height: 20),
            Text('Passionate about software development and solving real-world problems.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.blue.shade700),
                SizedBox(width: 10),
                Text(email, style: TextStyle(fontSize: 18, color: Colors.black54)),
              ],
            ),
            SizedBox(height: 20),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 10,
              ),
              child: Text('Logout', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15),
            Text('App Version 1.0.0', style: TextStyle(fontSize: 14, color: Colors.black54)),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                      onEmailChanged: onEmailChanged,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.grey.shade600,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                elevation: 8,
              ),
              child: Text('Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  final Function(String) onEmailChanged;

  SettingsScreen({required this.onEmailChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;
  String _privacySetting = 'Public';

  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController(text: 'john.doe@example.com');
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

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
              title: Text('Change Email'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showChangeEmailDialog(context);
              },
            ),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showChangePasswordDialog(context);
              },
            ),
            ListTile(
              title: Text('Privacy Settings'),
              subtitle: Text(_privacySetting),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showPrivacyDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Show email change dialog
  void _showChangeEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Email'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(labelText: 'New Email'),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.onEmailChanged(_emailController.text);
                Navigator.pop(context);
              },
              child: Text('Save', style: TextStyle(color: Colors.blue.shade700)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Show password change dialog
  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                  autofocus: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.onEmailChanged(_passwordController.text); // Or handle password change
                Navigator.pop(context);
              },
              child: Text('Save', style: TextStyle(color: Colors.blue.shade700)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Show privacy settings dialog
  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Privacy Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Public'),
                onTap: () {
                  setState(() {
                    _privacySetting = 'Public';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Private'),
                onTap: () {
                  setState(() {
                    _privacySetting = 'Private';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
