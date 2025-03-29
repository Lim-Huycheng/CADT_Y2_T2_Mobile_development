import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;

class CreatePostPage extends StatefulWidget {
  final bool isEdit;
  final int index;
  final Map<String, dynamic> post;

  const CreatePostPage({
    super.key,
    this.isEdit = false,
    this.index = -1,
    this.post = const {},
  });

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _postController = TextEditingController();

  bool isLoading = false;

  List<String> _badWords = [
    'arse', 'arsehead', 'arsehole', 'ass', 'ass hole', 'asshole', 'bastard', 'bitch',
    'bloody', 'bollocks', 'brotherfucker', 'bugger', 'bullshit', 'child-fucker',
    'Christ on a bike', 'Christ on a cracker', 'cock', 'cocksucker', 'crap', 'cunt',
    'dammit', 'damn', 'damned', 'damn it', 'dick', 'dick-head', 'dickhead', 'dumb ass',
    'dumb-ass', 'dumbass', 'dyke', 'faggot', 'father-fucker', 'fatherfucker', 'fuck', 
    'fucked', 'fucker', 'fucking', 'god dammit', 'goddammit', 'god damn', 'goddamn', 
    'goddamned', 'goddamnit', 'godsdamn', 'hell', 'holy shit', 'horseshit', 'in shit', 
    'jackarse', 'jack-ass', 'jackass', 'Jesus Christ', 'Jesus fuck', 'Jesus Harold Christ', 
    'Jesus H. Christ', 'Jesus, Mary and Joseph', 'Jesus wept', 'kike', 'mother fucker', 
    'mother-fucker', 'motherfucker', 'nigga', 'nigra', 'pigfucker', 'piss', 'prick', 'pussy', 
    'shit', 'shit ass', 'shite', 'sibling fucker', 'sisterfuck', 'sisterfucker', 'slut', 
    'son of a bitch', 'son of a whore', 'spastic', 'sweet Jesus', 'twat', 'wanker'
  ];

  bool containsEmail(String input) {
    RegExp emailRegExp = RegExp(
      r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}', caseSensitive: false,
    );
    return emailRegExp.hasMatch(input);
  }

  bool containsPhoneNumber(String input) {
    RegExp phoneRegExp = RegExp(
      r'(\+?[0-9]{1,4}[\s-]?)?(\(?\d{3}\)?[\s-]?)?[\d\s-]{7,}', caseSensitive: false,
    );
    return phoneRegExp.hasMatch(input);
  }

  bool containsLink(String input) {
    RegExp regExp = RegExp(
      r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', 
      caseSensitive: false,
    );
    return regExp.hasMatch(input);
  }

  String sanitizePostContent(String content) {
    var document = htmlParser.parse(content);
    return document.body?.text ?? content;
  }

  bool containsBadWords(String input) {
    String lowerCaseInput = input.toLowerCase();
    for (String badWord in _badWords) {
      if (lowerCaseInput.contains(badWord.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  void _createPost() async {
    if (_titleController.text.isNotEmpty && _postController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      String sanitizedContent = sanitizePostContent(_postController.text);

      if (containsLink(sanitizedContent)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Links are not allowed in the post')),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      if (containsEmail(sanitizedContent)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email addresses are not allowed in the post'))
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      if (containsPhoneNumber(sanitizedContent)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Phone numbers are not allowed in the post'))
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      if (containsBadWords(sanitizedContent)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Your post contains inappropriate language'))
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      String subtitle = sanitizedContent.length > 50
          ? sanitizedContent.substring(0, 50) + '...'
          : sanitizedContent;

      if (widget.isEdit) {
        Navigator.pop(context, {
          'index': widget.index,
          'title': _titleController.text,
          'subtitle': subtitle,
          'fullContent': sanitizedContent,
        });
      } else {
        Navigator.pop(context, {
          'title': _titleController.text,
          'subtitle': subtitle,
          'fullContent': sanitizedContent,
        });
      }

      setState(() {
        isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out both title and content before posting'))
      );
    }
  }

  bool isPostButtonEnabled() {
    return _titleController.text.isNotEmpty && _postController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      _titleController.text = widget.post['title'] ?? '';
      _postController.text = widget.post['fullContent'] ?? '';
    }
  }

  void _showUserPostPolicy() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'User Post Policy',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add a short intro to the policy
                  Text(
                    'Please read the following rules carefully before posting:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Display the rules as a list with bullet points
                  Text(
                    '1. No links are allowed in the post.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '2. No email addresses or phone numbers.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '3. Posts containing offensive language will be removed.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '4. Violating these rules may result in account suspension.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Add a note about what happens if they violate the rules
                  Text(
                    'Please remember that your account could face suspension if these rules are violated.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        widget.isEdit ? 'Edit Post' : 'Create Post',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'SourceSerif', // Or any custom font you prefer
        ),
      ),
      backgroundColor: Colors.blueAccent, // Custom background color
      elevation: 10, // Adds shadow for better depth
      centerTitle: true, // Centers the title
      actions: [
        // Optionally add an icon button on the right of the app bar
        IconButton(
          icon: Icon(Icons.info_outline, color: Colors.white),
          onPressed: () {
            // Trigger the post policy dialog when clicked
            _showUserPostPolicy();
          },
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30), // Custom border radius
        ),
      ),
      toolbarHeight: 80,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            widget.isEdit ? 'Edit Post' : 'Create Post',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontFamily: 'SourceSerif',
            ),
          ),
          const SizedBox(height: 20),
            Text(
              'What is the title of your post?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontFamily: 'SourceSerif',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Enter the title here',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 18, color: Colors.black),
                textInputAction: TextInputAction.next,
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'What do you want to share today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontFamily: 'SourceSerif',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _postController,
                decoration: InputDecoration(
                  hintText: 'Enter the content here',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: InputBorder.none,
                ),
                maxLines: null,
                style: TextStyle(fontSize: 18, color: Colors.black),
                textInputAction: TextInputAction.done,
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: isLoading || !isPostButtonEnabled() ? null : _createPost,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, minimumSize: Size(180, 50), backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        widget.isEdit ? 'Save Post' : 'Post',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _showUserPostPolicy,
                child: Text(
                  'Click here to view the user post policy',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
