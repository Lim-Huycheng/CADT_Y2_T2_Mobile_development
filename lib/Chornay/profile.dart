import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/welcome.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = 'Marklee526@gmail.com'; // Make email mutable

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
            Text('Mark Lee', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
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
                    builder: (context) => SettingsScreen(),
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
            )
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationEnabled = true;
  String _privacySetting = 'Public';
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Privacy & Security'),
            _buildCard(_buildPrivacyTile()),

            _buildSectionTitle('Preferences'),
            _buildCard(_buildNotificationTile()),
            _buildCard(_buildThemeTile()),
            _buildCard(_buildLanguageTile()),

            _buildSectionTitle('Account Management'),
            _buildCard(_buildManageDevicesTile()),
            _buildCard(_buildAccountDeletionTile()),

            _buildSectionTitle('Support'),
            _buildCard(_buildHelpSupportTile()),
            _buildCard(_buildLogoutTile()),
          ],
        ),
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade700),
      ),
    );
  }

  // Custom Card for better UI
  Widget _buildCard(Widget child) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: child),
    );
  }

  // Privacy Settings Tile
  ListTile _buildPrivacyTile() {
    return ListTile(
      leading: Icon(Icons.lock, color: Colors.blue),
      title: Text('Privacy Settings'),
      subtitle: Text(_privacySetting),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _showPrivacyDialog(context),
    );
  }

  ListTile _buildNotificationTile() {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.orange),
      title: Text('Notifications'),
      trailing: Switch(
        value: _isNotificationEnabled,
        onChanged: (bool value) {
          setState(() {
            _isNotificationEnabled = value;
          });
        },
      ),
    );
  }

  ListTile _buildThemeTile() {
    return ListTile(
      leading: Icon(Icons.dark_mode, color: Colors.purple),
      title: Text('Dark Mode'),
      trailing: Switch(
        value: _isDarkMode,
        onChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
    );
  }

  // Language Selection Tile
  ListTile _buildLanguageTile() {
    return ListTile(
      leading: Icon(Icons.language, color: Colors.green),
      title: Text('Select Language'),
      subtitle: Text(_selectedLanguage),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _showLanguageDialog(context),
    );
  }

  // Manage Devices Tile
  ListTile _buildManageDevicesTile() {
    return ListTile(
      leading: Icon(Icons.devices, color: Colors.blue.shade700),
      title: Text('Manage Connected Devices'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _showManageDevicesDialog(context),
    );
  }

  // Account Deletion Tile
  ListTile _buildAccountDeletionTile() {
    return ListTile(
      leading: Icon(Icons.delete, color: Colors.red),
      title: Text('Account Deletion'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _showAccountDeletionDialog(context),
    );
  }

  // Help & Support Tile
  ListTile _buildHelpSupportTile() {
    return ListTile(
      leading: Icon(Icons.help, color: Colors.teal),
      title: Text('Help & Support'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _showHelpSupportDialog(context),
    );
  }

  // Logout Tile
  ListTile _buildLogoutTile() {
    return ListTile(
      leading: Icon(Icons.exit_to_app, color: Colors.red),
      title: Text('Logout'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => _showLogoutDialog(context),
    );
  }

  // Show Privacy Settings Dialog
  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Privacy Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['Public', 'Private', 'Friends Only']
                .map((option) => ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          _privacySetting = option;
                        });
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  // Show Language Selection Dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['English', 'Khmer', 'French']
                .map((lang) => ListTile(
                      title: Text(lang),
                      onTap: () {
                        setState(() {
                          _selectedLanguage = lang;
                        });
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  // Show Manage Devices Dialog
  void _showManageDevicesDialog(BuildContext context) {
    List<String> connectedDevices = [
      'Vivo v29e - Connected',
      'IPhone 13 - Disconnected',
      'Samsung Galaxy S20 - Connected',
      'Google Pixel 6 - Disconnected',
      'Huawei P40 - Disconnected',
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Manage Connected Devices'),
          content: Container(
            width: double.maxFinite,
            height: 250, // Adjust the height as needed
            child: ListView.builder(
              itemCount: connectedDevices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(connectedDevices[index]),
                  trailing: Icon(
                    connectedDevices[index].contains('Connected') 
                        ? Icons.check_circle 
                        : Icons.remove_circle,
                    color: connectedDevices[index].contains('Connected')
                        ? Colors.green
                        : Colors.red,
                  ),
                  onTap: () {
                    // Handle device management logic here, e.g., disconnect
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: TextStyle(color: Colors.blue.shade700)),
            ),
          ],
        );
      },
    );
  }


  // Show Account Deletion Dialog
  void _showAccountDeletionDialog(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    String? selectedReason;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Deletion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to delete your account? This action is irreversible.'),
              SizedBox(height: 10),

              // Reason Selection Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Reason for deleting (optional)'),
                items: ['Privacy Concerns', 'Not Useful', 'Other']
                    .map((reason) => DropdownMenuItem(
                          value: reason,
                          child: Text(reason),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedReason = value;
                },
              ),

              SizedBox(height: 10),

              // Password Input Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter your password.')),
                  );
                  return;
                }

                // Print or send the reason (if selected)
                print('Account Deletion Reason: ${selectedReason ?? "No reason provided"}');

                // Simulate account deletion logic
                Navigator.pop(context); // Close dialog

                // Show success message
                _showSuccessDialog(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.blue.shade700)),
            ),
          ],
        );
      },
    );
  }

  // Show Success Message After Deletion
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Deleted'),
          content: Text('Your account has been successfully deleted.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close success dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ),
                );
              },
              child: Text('OK', style: TextStyle(color: Colors.blue.shade700)),
            ),
          ],
        );
      },
    );
  }


  // Show Help & Support Dialog
  void _showHelpSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Help & Support'),
          content: Text('Contact our support team at humanfirewall@gmail.com for assistance.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: TextStyle(color: Colors.blue.shade700)),
            ),
          ],
        );
      },
    );
  }

  // Show Logout Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('No', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ),
                );
              },
              child: Text('Yes', style: TextStyle(color: Colors.blue.shade700)),
            ),
          ],
        );
      },
    );
  }
}
