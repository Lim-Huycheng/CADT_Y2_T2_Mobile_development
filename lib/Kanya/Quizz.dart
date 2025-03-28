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

  final Map<String, List<Map<String, dynamic>>> questionsByCategory = {
    'Phishing': [
      {
        'question': 'What is the primary goal of a phishing attack?',
        'answers': [
          'To overload a server with traffic',
          'To trick users into revealing sensitive information',
          'To gain unauthorized network access',
          'To install malware on a system'
        ],
        'correctAnswer': 'To trick users into revealing sensitive information',
        'explanation': 'Phishing attacks deceive users into giving away sensitive data.'
      },
      {
        'question': 'Which method is commonly used in phishing emails?',
        'answers': [
          'Encrypted attachments',
          'Urgent requests for personal information',
          'Digital certificates',
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
          'Enhance system security',
          'Cause harm to a system',
          'Improve network performance',
          'Monitor network traffic for security'
        ],
        'correctAnswer': 'Cause harm to a system',
        'explanation': 'Malware is designed to damage, disrupt, or gain unauthorized access.'
      },
      {
        'question': 'Which of the following is a type of malware?',
        'answers': [
          'Firewall',
          'Ransomware',
          'Antivirus',
          'Virtual Private Network (VPN)'
        ],
        'correctAnswer': 'Ransomware',
        'explanation': 'Ransomware encrypts files and demands payment for the decryption key.'
      },
      {
        'question': 'What is a common way malware spreads?',
        'answers': [
          'Through software updates',
          'By clicking on suspicious links',
          'By using strong passwords',
          'Through firewall logs'
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

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
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
      Navigator.pop(context);
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
        padding: const EdgeInsets.all(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 20),
            Text(
              'Choose only one correct answer!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: showResult
                      ? (selectedAnswer == questions[currentQuestionIndex]['correctAnswer']
                          ? Colors.green
                          : Colors.red)
                      : Colors.transparent,
                  width: 2,
                ),
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
                    children: questions[currentQuestionIndex]['answers'].map<Widget>((answer) {
                      bool isCorrectAnswer = answer == questions[currentQuestionIndex]['correctAnswer'];
                      bool isSelectedAnswer = selectedAnswer == answer;

                      return RadioListTile(
                        title: Text(answer),
                        value: answer,
                        groupValue: selectedAnswer,
                        onChanged: (value) {
                          if (!showResult) {
                            checkAnswer(value as String);
                          }
                        },
                        activeColor: isCorrectAnswer ? Colors.green : Colors.grey,
                        tileColor: isSelectedAnswer
                            ? (isCorrectAnswer ? Colors.green.shade100 : Colors.red.shade100)
                            : null,
                      );
                    }).toList(),
                  ),
                  if (showResult && selectedAnswer != questions[currentQuestionIndex]['correctAnswer'])
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Correct Answer: ${questions[currentQuestionIndex]['correctAnswer']}\n${questions[currentQuestionIndex]['explanation']}',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: selectedAnswer.isNotEmpty ? () => nextQuestion(context) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  disabledBackgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1 ? 'Next' : 'Finish',
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
