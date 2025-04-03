import 'package:flutter/material.dart';
import 'Quizz.dart';

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
            'assets/images/Category.jpg',
            width: 200,
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            "Let's test your knowledge",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text("Choose a Topic below"),
          SizedBox(height: 45),
          QuizTopicButton(
            text: "Social Engineering",
            icon: Icons.email,
            category: 'Phishing',
          ),
          QuizTopicButton(
            text: "Malware",
            icon: Icons.bug_report,
            category: 'Malware',
          ),
          QuizTopicButton(
            text: "Network Attack",
            icon: Icons.security,
            category: 'Network Attack',
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
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.blue, width: 2),
          ),
          shadowColor: Colors.blueAccent,
          elevation: 5,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blueAccent),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz_time.jpg',
              width: 400,
              height: 400,
            ),
            SizedBox(height: 20),
            Text(
              "Start Quizzes!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quiz(category: category),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  backgroundColor: const Color(0xFF0081D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.blueAccent,
                  elevation: 6,
                  minimumSize: Size(180, 50),
                ),
                child: Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
