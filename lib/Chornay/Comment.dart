import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  final Map<String, dynamic> post;

  const CommentPage({super.key, required this.post});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();
  String? _replyingTo;
  late List<Map<String, dynamic>> commentsList;

  @override
  void initState() {
    super.initState();
    commentsList = widget.post['commentsList']
        .map<Map<String, dynamic>>((comment) => {
              'user': comment['user'],
              'comment': comment['comment'],
              'likes': comment.containsKey('likes') ? comment['likes'] : 0,
              'isLiked': false,
              'replies': comment.containsKey('replies') ? comment['replies'] : []
            })
        .toList();
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        if (_replyingTo == null) {
          commentsList.insert(0, {
            'user': 'New User',
            'comment': _commentController.text,
            'likes': 0,
            'isLiked': false,
            'replies': []
          });
        } else {
          final parentComment = commentsList.firstWhere(
              (comment) => comment['user'] == _replyingTo,
              orElse: () => {});
          if (parentComment.isNotEmpty) {
            parentComment['replies'].add({
              'user': 'New User',
              'comment': _commentController.text,
              'likes': 0,
              'isLiked': false
            });
          }
        }
        _commentController.clear();
        _replyingTo = null;
      });
    }
  }

  void _toggleLike(int index) {
    setState(() {
      commentsList[index]['isLiked'] = !commentsList[index]['isLiked'];
      commentsList[index]['isLiked']
          ? commentsList[index]['likes']++
          : commentsList[index]['likes']--;
    });
  }

  void _replyToComment(String user) {
    setState(() {
      _replyingTo = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        backgroundColor: const Color(0xFF0081D7),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Comment list section
              ListView.builder(
                shrinkWrap: true, // This ensures the ListView doesn't take all space
                physics: NeverScrollableScrollPhysics(), // Disables scrolling in ListView
                itemCount: commentsList.length,
                itemBuilder: (context, index) {
                  final comment = commentsList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            comment['user'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(comment['comment']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  comment['isLiked'] ? Icons.thumb_up : Icons.thumb_up_off_alt,
                                  color: comment['isLiked'] ? Colors.blue : null,
                                ),
                                onPressed: () => _toggleLike(index),
                              ),
                              Text('${comment['likes']}'),
                              IconButton(
                                icon: const Icon(Icons.reply),
                                onPressed: () => _replyToComment(comment['user']),
                              ),
                            ],
                          ),
                        ),
                        if (comment['replies'].isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Column(
                              children: List.generate(comment['replies'].length, (replyIndex) {
                                final reply = comment['replies'][replyIndex];
                                return ListTile(
                                  title: Text(
                                    reply['user'],
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(reply['comment']),
                                );
                              }),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),

              // Replying to section
              if (_replyingTo != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Replying to $_replyingTo',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                ),

              // Comment input field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue), // Focused border color
                    ),
                  ),
                ),
              ),

              // Add Comment / Reply button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set text color
                  ),
                  onPressed: _addComment,
                  child: Text(_replyingTo == null ? 'Add Comment' : 'Reply', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
