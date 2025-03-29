import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:human_firewall/Kanya/quizz_category.dart';
import 'firebase_options.dart';
import 'package:human_firewall/Lymean/welcome.dart';
import 'package:human_firewall/Huycheng/Homepage.dart';

import 'Cheat/notifi_cation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
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
