import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for SystemChrome
import 'package:human_firewall/Cheat/show_history.dart';
import 'package:human_firewall/Huycheng/HomePage0.dart';
import 'package:human_firewall/Lymean/welcome.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Hide the status bar and navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Sets the background color to white
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0, // Removes shadow
          iconTheme: IconThemeData(color: Colors.black), // Ensures icons are visible
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.white, 
          secondary: Colors.blue, // Adjust as needed
        ),
      ),
      home: const Welcome(),
    );
  }
}
