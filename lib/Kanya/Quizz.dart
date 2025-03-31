import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final String category;

  const Quiz({super.key, required this.category});

  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  String selectedAnswer = '';
  bool showResult = false;
  bool isCorrect = false;
  int score = 0;

  final Map<String, List<Map<String, dynamic>>> questionsByCategory = {
    'Phishing': [
      {
        'question': 'What is the primary goal of a phishing attack?',
        'answers': [
          'To overload a server with traffic',
          'To install malware on a system',
          'To gain unauthorized network access',
          'To trick users into revealing sensitive information'
        ],
        'correctAnswer': 'To trick users into revealing sensitive information',
        'explanation': 'Phishing attacks deceive users into giving away sensitive data.'
      },
      {
        'question': 'Which method is commonly used in phishing emails?',
        'answers': [
          'Urgent requests for personal information',
          'Digital certificates',
          'Encrypted attachments',
          'Password managers'
        ],
        'correctAnswer': 'Urgent requests for personal information',
        'explanation': 'Phishing emails often create urgency to trick users into sharing data.'
      },
      {
        'question': 'How can you identify a phishing website?',
        'answers': [
          'Secure HTTPS connection',
          'Misspelled URL and poor design',
          'Official company logo',
          'Detailed privacy policy'
        ],
        'correctAnswer': 'Misspelled URL and poor design',
        'explanation': 'Phishing sites often have misspelled URLs and low-quality design.'
      },
    ],
    'Malware': [
      {
        'question': 'What does malware do?',
        'answers': [
          'Monitor network traffic for security',
          'Improve network performance',
          'Cause harm to a system',
          'Enhance system security'
        ],
        'correctAnswer': 'Cause harm to a system',
        'explanation': 'Malware is designed to damage, disrupt, or gain unauthorized access.'
      },
      {
        'question': 'Which of the following is a type of malware?',
        'answers': [
          'Ransomware',
          'Firewall',
          'Antivirus',
          'Virtual Private Network (VPN)'
        ],
        'correctAnswer': 'Ransomware',
        'explanation': 'Ransomware encrypts files and demands payment for the decryption key.'
      },
      {
        'question': 'What is a common way malware spreads?',
        'answers': [
          'By using strong passwords',
          'Through software updates',
          'Through firewall logs',
          'By clicking on suspicious links'
        ],
        'correctAnswer': 'By clicking on suspicious links',
        'explanation': 'Malware often spreads through malicious links or email attachments.'
      },
    ],
    'Network Attack': [
      {
        'question': 'What is a common network attack?',
        'answers': [
          'Distributed Denial of Service (DDoS)',
          'Updating firewall rules',
          'Installing security patches',
          'Encrypting user passwords'
        ],
        'correctAnswer': 'Distributed Denial of Service (DDoS)',
        'explanation': 'A DDoS attack floods a network with traffic to disrupt services.'
      },
      {
        'question': 'Which tool is commonly used in network attacks?',
        'answers': [
          'Wireshark',
          'Ping',
          'Nmap',
          'Task Manager'
        ],
        'correctAnswer': 'Nmap',
        'explanation': 'Nmap is used to discover hosts and services on a network, often in attacks.'
      },
      {
        'question': 'What is the purpose of a man-in-the-middle (MITM) attack?',
        'answers': [
          'To enhance network performance',
          'To intercept and modify communication',
          'To secure data transmission',
          'To monitor network bandwidth'
        ],
        'correctAnswer': 'To intercept and modify communication',
        'explanation': 'MITM attacks intercept communication to steal or manipulate data.'
      },
    ],
  };

  void checkAnswer() {
    setState(() {
      isCorrect = selectedAnswer == questions[currentQuestionIndex]['correctAnswer'];
      if (isCorrect) score++;
      showResult = true;
    });
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = '';
        showResult = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(score: score, total: questions.length)),
      );
    }
  }

  List<Map<String, dynamic>> get questions {
    return questionsByCategory[widget.category] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '${widget.category} Quiz',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1} of ${questions.length}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blueAccent),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose only one correct answer!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[currentQuestionIndex]['question'],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: questions[currentQuestionIndex]['answers'].map<Widget>((String answer) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: RadioListTile<String>(
                              title: Text(answer, style: TextStyle(fontSize: 16, color: Colors.black)),
                              value: answer,
                              groupValue: selectedAnswer,
                              onChanged: showResult ? null : (value) {
                                setState(() {
                                  selectedAnswer = value!;
                                });
                              },
                              activeColor: Colors.blueAccent, // Accent color for the selected answer
                            ),
                          );
                        }).toList(),
                      ),
                      if (showResult)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isCorrect ? 'Correct!' : 'Wrong!',
                                  style: TextStyle(
                                    color: isCorrect ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'The correct answer is: ${questions[currentQuestionIndex]['correctAnswer']}',
                                  style: TextStyle(
                                    color: Colors.blue.shade800,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Explanation: ${questions[currentQuestionIndex]['explanation']}',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedAnswer.isEmpty
                    ? null
                    : showResult
                        ? () => nextQuestion(context)
                        : checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  showResult ? 'Next' : 'Confirm Answer',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  const ResultPage({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Completed'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, size: 100, color: Colors.amber),
            SizedBox(height: 20),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You scored $score out of $total!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
              child: Text('Return to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
