import 'package:flutter/material.dart';
import 'Quizz.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:human_firewall/Huycheng/Homepage.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  QuizHomeState createState() => QuizHomeState();
}

class QuizHomeState extends State<QuizHome> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0081D7),
        title: null,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: const Text(
              'Quiz',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Image.asset(
            'assets/images/Category.jpg', // Replace with the correct image path
            width: 200,  // Adjust the width if needed
            height: 150, // Adjust the height if needed
          ),
          SizedBox(height: 10),
          Text(
            "Let's test your knowledge",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text("Choose a Topic below"),
          SizedBox(height: 20),
          QuizTopicButton(
            text: "Social Engineering",
            icon: Icons.email,
            category: 'Phishing', // Passing the category name
          ),
          QuizTopicButton(
            text: "Malware",
            icon: Icons.bug_report,
            category: 'Malware', // Passing the category name
          ),
          QuizTopicButton(
            text: "Network Attack",
            icon: Icons.security,
            category: 'Network Attack', // Passing the category name
          ),
        ],
      ),
    );
  }
}

class QuizTopicButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final String category;

  const QuizTopicButton({super.key, required this.text, required this.icon, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blue),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StartQuizPage(category: category),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Align the content to the start
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartQuizPage extends StatelessWidget {
  final String category;

  const StartQuizPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quiz', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 23)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700, // Same as Category page
        toolbarHeight: 100, // Match the header height from Category page
      ),
      body: Center( // Centering the entire content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz_time.jpg', // Replace with your image path
              width: 400,
              height: 350,
            ),
            
            Text(
              "Start Quizzes!",
              style: TextStyle(
                fontSize: 35, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Quiz Page with the selected category
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz(category: category),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 30), // Increased vertical padding
                  backgroundColor: Colors.blue.shade700, // Blue background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(200, 60), // Set a fixed minimum size for the button
                ),
                child: Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 22, // Increased font size for better visibility
                    fontWeight: FontWeight.bold, // Bold text
                    color: Colors.white, // White text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
