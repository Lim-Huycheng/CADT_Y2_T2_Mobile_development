import 'package:flutter/material.dart';
import 'package:human_firewall/Chornay/CreatePost.dart';
import 'package:human_firewall/Chornay/PostDetailPage.dart';
import 'package:human_firewall/Chornay/Comment.dart';

class PostFeedPage extends StatefulWidget {
  const PostFeedPage({super.key});

  @override
  _PostFeedPageState createState() => _PostFeedPageState();
}

class _PostFeedPageState extends State<PostFeedPage> {

  final List<Map<String, dynamic>> posts = [
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=MPCzU5dOi2y9&format=png&color=000000',
      'name': 'Lymean Chhay',
      'date': '3 hours ago',
      'title': 'How to protect against phishing attacks?',
      'subtitle': 'Phishing attacks have become increasingly sophisticated, targeting...',
      'fullContent': 'Phishing attacks have become increasingly sophisticated, targeting individuals to steal sensitive information. To protect yourself, always verify the source of suspicious emails or messages, and avoid clicking on unknown links. Be cautious of mismatched URLs, as attackers often use fake sites to steal data. Enable multi-factor authentication (MFA) for added security, and regularly update your software to patch vulnerabilities. Use anti-phishing tools to detect threats, and educate yourself and others about common phishing tactics. Staying vigilant is the key to safeguarding your information against these attacks.',
      'likes': 5,
      'comments': 2,
      'shares': 1,
      'isLiked': false,
      'commentsList': [
        {'user': 'NiNeat', 'comment': 'I think it is difficult to protect against phishing attacks!'},
        {'user': 'User 2', 'comment': 'Thanks for the tips!'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=41086&format=png&color=000000',
      'name': 'Sophal Vann',
      'date': '8 hours ago',
      'title': 'Best practices for online security',
      'subtitle': 'Online security is more important than ever in today’s digital world...',
      'fullContent': 'Online security is more important than ever in today’s digital world. To keep your information safe, make sure to use strong and unique passwords for each of your accounts. Avoid using public Wi-Fi for sensitive transactions, and always check for secure HTTPS connections. Be cautious when downloading files, and install antivirus software to detect threats. Regularly back up your data and keep your devices updated with the latest security patches.',
      'likes': 12,
      'comments': 3,
      'shares': 3,
      'isLiked': true,
      'commentsList': [
        {'user': 'SecurityPro', 'comment': 'Password managers are really helpful!'},
        {'user': 'TechGuru', 'comment': 'Definitely agree with avoiding public Wi-Fi for banking.'},
        {'user': 'User 1', 'comment': 'Good advice! I always update my software weekly.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=24964&format=png&color=000000',
      'name': 'Met Sokhcheat',
      'date': '10 hours ago',
      'title': 'How to identify malicious websites?',
      'subtitle': 'Malicious websites can be a serious threat to your personal data...',
      'fullContent': 'Malicious websites can be a serious threat to your personal data and privacy. Always check the URL before visiting a site, looking for typos or unusual characters. Avoid clicking on suspicious links or pop-ups, and make sure the website has an HTTPS connection. Install a website-blocking tool that can identify harmful websites. Stay cautious of fake login pages or sites that ask for sensitive information, and make sure to keep your browser up to date with the latest security features.',
      'likes': 8,
      'comments': 3,
      'shares': 2,
      'isLiked': false,
      'commentsList': [
        {'user': 'PhishingDefender', 'comment': 'I always double-check URLs before entering any details.'},
        {'user': 'WebSurfer', 'comment': 'Malicious websites are getting more difficult to spot!'},
        {'user': 'User 3', 'comment': 'Thanks for the tip on HTTPS sites! I never thought of that.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=23549&format=png&color=000000',
      'name': 'Vannak Sok',
      'date': '12 hours ago',
      'title': 'Social engineering and how to protect yourself?',
      'subtitle': 'Social engineering is one of the most common tactics for cyber attacks...',
      'fullContent': 'Social engineering attacks manipulate people into revealing confidential information. These attacks can happen through phone calls, emails, or even in person. To protect yourself, always verify requests for sensitive information, especially from unknown sources. Be cautious of unsolicited offers or threats, and never share personal details unless you are certain of the source. Stay educated about common tactics like phishing, vishing, and pretexting to reduce the chances of falling victim.',
      'likes': 4,
      'comments': 1,
      'shares': 2,
      'isLiked': true,
      'commentsList': [
        {'user': 'TechWhiz', 'comment': 'Social engineering is a major threat. Always stay alert!'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=10002&format=png&color=000000',
      'name': 'Phalla Mony',
      'date': '14 hours ago',
      'title': 'Why multi-factor authentication is essential?',
      'subtitle': 'Multi-factor authentication (MFA) is one of the most effective ways...',
      'fullContent': 'Multi-factor authentication (MFA) is one of the most effective ways to secure your online accounts. By requiring additional verification, such as a code sent to your phone or email, it makes it much harder for attackers to gain unauthorized access. Always enable MFA on accounts that support it, especially for sensitive services like banking or email. Even if your password is compromised, MFA adds an extra layer of protection.',
      'likes': 10,
      'comments': 4,
      'shares': 5,
      'isLiked': false,
      'commentsList': [
        {'user': 'CyberSecFan', 'comment': 'MFA saved me from a potential hack!'},
        {'user': 'Techie', 'comment': 'Always use MFA for email and banking, never leave them unprotected!'},
        {'user': 'User 4', 'comment': 'Thanks for explaining MFA! I wasn’t sure how it works.'},
        {'user': 'HackerBeGone', 'comment': 'MFA is a lifesaver!'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=30167&format=png&color=000000',
      'name': 'Vann Rithy',
      'date': '15 hours ago',
      'title': 'Avoiding scams during online shopping!',
      'subtitle': 'Online shopping is convenient, but it comes with its own risks...',
      'fullContent': 'Online shopping is convenient, but it comes with its own risks. Be cautious when shopping on unfamiliar websites, especially if they offer deals that seem too good to be true. Always verify the site’s authenticity by checking reviews and ensuring it has secure payment methods. Avoid using public Wi-Fi for transactions, and use credit cards or secure payment systems for purchases. Stay alert to fake websites that look similar to trusted brands but are designed to steal your payment details.',
      'likes': 7,
      'comments': 2,
      'shares': 3,
      'isLiked': true,
      'commentsList': [
        {'user': 'ShopSafe', 'comment': 'I always double-check reviews before buying anything online!'},
        {'user': 'BuyerBeware', 'comment': 'Great advice, I’ve been scammed before!' }
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=15436&format=png&color=000000',
      'name': 'Tep Rithy',
      'date': '17 hours ago',
      'title': 'How to keep your passwords secure?',
      'subtitle': 'Your passwords are the gateway to your online accounts...',
      'fullContent': 'Your passwords are the gateway to your online accounts, and it’s crucial to keep them secure. Use long and complex passwords, with a mix of letters, numbers, and symbols. Avoid using personal information such as your name or birthdate. Use a password manager to keep track of your credentials, and enable two-factor authentication (2FA) wherever possible. Never share your passwords with others and be cautious of phishing attempts that try to steal them.',
      'likes': 6,
      'comments': 3,
      'shares': 1,
      'isLiked': false,
      'commentsList': [
        {'user': 'PasswordMaster', 'comment': 'I use a password manager, it’s so much easier to manage my passwords!'},
        {'user': 'SecureUser', 'comment': 'Good advice, I’ll try to make my passwords more complex.'},
        {'user': 'User 5', 'comment': 'Never share your password! It’s the first rule of security.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=105265&format=png&color=000000',
      'name': 'Mey Chamroeun',
      'date': '18 hours ago',
      'title': 'Recognizing and avoiding phishing emails',
      'subtitle': 'Phishing emails often contain misleading URLs and suspicious attachments...',
      'fullContent': 'Phishing emails often contain misleading URLs and suspicious attachments designed to trick you into revealing personal information. Look for signs such as generic greetings, urgent requests, and poor grammar. Avoid clicking on links or downloading attachments from unknown sources. Always verify the sender’s email address and be cautious of emails that ask for sensitive information, especially if you weren’t expecting it. Stay educated on the latest phishing tactics to protect yourself.',
      'likes': 9,
      'comments': 2,
      'shares': 4,
      'isLiked': true,
      'commentsList': [
        {'user': 'PhishingGuard', 'comment': 'I always double-check the sender’s email address.'},
        {'user': 'SecurityGuru', 'comment': 'Phishing is getting harder to spot, so stay vigilant!'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=18531&format=png&color=000000',
      'name': 'Somnang Sinath',
      'date': '19 hours ago',
      'title': 'Keeping your Wi-Fi network secure',
      'subtitle': 'Your Wi-Fi network is a potential entry point for hackers...',
      'fullContent': 'Your Wi-Fi network is a potential entry point for hackers, so it’s important to secure it properly. Change the default router password, and use WPA3 encryption for added security. Disable remote management and guest networks if not needed. Regularly check which devices are connected to your network and make sure your firmware is up to date. Set up a VPN if possible, and avoid sharing your Wi-Fi password with unauthorized users.',
      'likes': 11,
      'comments': 6,
      'shares': 7,
      'isLiked': true,
      'commentsList': [
        {'user': 'SecureHome', 'comment': 'I changed my router password and updated my firmware recently!'},
        {'user': 'TechSafety', 'comment': 'Always disable remote management on your router.'},
        {'user': 'NetSecurity', 'comment': 'Using WPA3 encryption is a must!' },
        {'user': 'HomeNet', 'comment': 'I set up a VPN at home for better security.'},
        {'user': 'GuestAccess', 'comment': 'I never share my Wi-Fi password with strangers.'},
        {'user': 'WiFiSecurity', 'comment': 'Great post! Always make sure your network is secure.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=w2uVveyXNQ1f&format=png&color=000000',
      'name': 'Rathana Hout',
      'date': '20 hours ago',
      'title': 'What are the dangers of public\nWi-Fi?',
      'subtitle': 'Public Wi-Fi can be a hacker’s playground...',
      'fullContent': 'Public Wi-Fi is convenient but poses many security risks. Attackers can intercept your data and steal sensitive information when you connect to unsecured networks. Avoid accessing bank accounts or making online purchases when on public Wi-Fi. Use a VPN to encrypt your internet connection and always ensure that the Wi-Fi network is legitimate before connecting.',
      'likes': 3,
      'comments': 2,
      'shares': 1,
      'isLiked': false,
      'commentsList': [
        {'user': 'TechGuru', 'comment': 'Always use a VPN on public networks.'},
        {'user': 'SecureIt', 'comment': 'Very important advice! I always turn off Wi-Fi when in public places.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=-qXJsKDX58z4&format=png&color=000000',
      'name': 'Sokha Chan',
      'date': '23 hours ago',
      'title': 'The importance of strong passwords!',
      'subtitle': 'A strong password is your first line of defense...',
      'fullContent': 'Passwords are often the weakest link in your digital security. Use a combination of uppercase and lowercase letters, numbers, and symbols to create a strong password. Avoid using easily guessable information, such as names or birthdays. It’s also important to use different passwords for different accounts. Consider using a password manager to keep track of your complex passwords securely.',
      'likes': 7,
      'comments': 1,
      'shares': 0,
      'isLiked': true,
      'commentsList': [
        {'user': 'PasswordPro', 'comment': 'I started using a password manager and it’s a game changer.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=120625&format=png&color=000000',
      'name': 'Sreymom Som',
      'date': '2 days ago',
      'title': 'How to identify fake websites?',
      'subtitle': 'Fake websites can look surprisingly real...',
      'fullContent': 'Fake websites often try to mimic legitimate ones. Look for subtle signs, like misspelled words, incorrect logos, or strange URLs. Always check for HTTPS encryption in the website’s URL, especially when entering sensitive information. If in doubt, type the website address directly into the browser instead of clicking on a link from an email or social media post.',
      'likes': 9,
      'comments': 3,
      'shares': 2,
      'isLiked': true,
      'commentsList': [
        {'user': 'WebSecurity', 'comment': 'It’s easy to fall for a fake site if you’re not careful.'},
        {'user': 'CyberDefender', 'comment': 'Always double-check the URL, especially on banking sites.'},
        {'user': 'User99', 'comment': 'I’ve been scammed before. This is great advice!'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=UY97iRwDtZwb&format=png&color=000000',
      'name': 'Vannak Rith',
      'date': '2 days ago',
      'title': 'Why is two-factor authentication important?',
      'subtitle': 'Two-factor authentication (2FA) adds an extra layer of security...',
      'fullContent': 'With two-factor authentication (2FA), even if your password is compromised, your account remains secure. 2FA requires a second form of verification, such as a code sent to your phone or email. This makes it significantly harder for attackers to gain unauthorized access to your accounts. Enable 2FA on all your important accounts, like email, social media, and banking.',
      'likes': 4,
      'comments': 0,
      'shares': 1,
      'isLiked': false,
      'commentsList': []
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=38362&format=png&color=000000',
      'name': 'Samnang Vuth',
      'date': '2 days ago',
      'title': 'What is social engineering?',
      'subtitle': 'Social engineering is the art of manipulating people...',
      'fullContent': 'Social engineering attacks rely on tricking individuals into revealing confidential information. This can include phishing emails, phone calls, or even in-person interactions. Always be cautious when someone asks for personal information, even if they claim to be from a trusted company. Verify their identity before sharing any sensitive data.',
      'likes': 6,
      'comments': 1,
      'shares': 0,
      'isLiked': true,
      'commentsList': [
        {'user': 'InfoSecExpert', 'comment': 'Social engineering is one of the most common ways hackers gain access to systems.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=38517&format=png&color=000000',
      'name': 'Reaksmey Phan',
      'date': '3 days ago',
      'title': 'The risks of using outdated software',
      'subtitle': 'Outdated software can be a hacker’s gateway...',
      'fullContent': 'When you don’t update your software, you leave your system vulnerable to known security flaws. Hackers often target these vulnerabilities to gain access to your device. Always keep your software up-to-date to patch any security issues and prevent attacks. Set your devices to automatically update whenever possible, and make sure you’re using the latest version of all programs.',
      'likes': 2,
      'comments': 0,
      'shares': 0,
      'isLiked': false,
      'commentsList': []
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=12518&format=png&color=000000',
      'name': 'Sovannara Kim',
      'date': '3 days ago',
      'title': 'The role of encryption in cybersecurity',
      'subtitle': 'Encryption is essential for keeping data safe...',
      'fullContent': 'Encryption converts data into unreadable code, making it unreadable to unauthorized users. This process helps to protect sensitive information such as passwords, bank details, and personal messages. Always use encrypted services for your online transactions and communications. Ensure your Wi-Fi network is encrypted, and consider using end-to-end encryption for private messaging.',
      'likes': 8,
      'comments': 4,
      'shares': 1,
      'isLiked': true,
      'commentsList': [
        {'user': 'SecureTech', 'comment': 'Encryption is key to protecting data online.'},
        {'user': 'PrivacyMatters', 'comment': 'End-to-end encryption is a must for any messaging app.'},
        {'user': 'DataProtection', 'comment': 'Never send sensitive information without encryption.'},
        {'user': 'User123', 'comment': 'Great explanation, I use encrypted messaging apps daily.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=38512&format=png&color=000000',
      'name': 'Chenda Ly',
      'date': '3 days ago',
      'title': 'The dangers of oversharing on social media',
      'subtitle': 'Sharing too much personal information can be dangerous...',
      'fullContent': 'Oversharing personal information on social media can lead to identity theft, cyberstalking, or even physical threats. Always be cautious about what you share publicly. Avoid posting sensitive information like your home address, vacation plans, or financial details. Review your privacy settings to control who can see your posts, and be mindful of the risks when tagging locations.',
      'likes': 3,
      'comments': 1,
      'shares': 1,
      'isLiked': false,
      'commentsList': [
        {'user': 'SafeOnline', 'comment': 'I never post personal info on social media.'}
      ]
    },
    {
      'profileUrl': 'https://img.icons8.com/?size=100&id=97352&format=png&color=000000',
      'name': 'Keo Sokanya',
      'date': '3 days ago',
      'title': 'What is ransomware and how to avoid it?',
      'subtitle': 'Ransomware attacks can lock you out of your files...',
      'fullContent': 'Ransomware is malicious software that locks your files or entire system until a ransom is paid. These attacks often come through email attachments or compromised websites. To avoid ransomware, always back up your data regularly, avoid downloading suspicious files, and ensure your antivirus software is up-to-date. In case of an attack, never pay the ransom. Instead, seek professional help to remove the malware and restore your files from backups.',
      'likes': 10,
      'comments': 5,
      'shares': 3,
      'isLiked': true,
      'commentsList': [
        {'user': 'TechDefender', 'comment': 'Ransomware attacks are scary, but backing up data helps a lot.'},
        {'user': 'SecurityGuru', 'comment': 'I had a ransomware attack last year. Backing up is essential.'},
        {'user': 'SecureUser', 'comment': 'Never pay the ransom, it only encourages the criminals.'},
        {'user': 'SafeData', 'comment': 'Make sure your backup is offline or in the cloud to avoid ransomware attacks.'},
        {'user': 'User456', 'comment': 'Great tips, I’ll be more careful from now on!'}
      ]
    }
  ];

  List<Map<String, dynamic>> filteredPosts = [];
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    filteredPosts = List.from(posts);
    _searchController.addListener(filterPosts);
  }

  void filterPosts() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      filteredPosts = posts.where((post) {
        return post['title'].toString().toLowerCase().contains(query) ||
            post['subtitle'].toString().toLowerCase().contains(query);
      }).toList();
    });
  }

  void _onLike(int index) {
    setState(() {
      filteredPosts[index]['isLiked'] = !filteredPosts[index]['isLiked'];
      filteredPosts[index]['isLiked']
          ? filteredPosts[index]['likes']++
          : filteredPosts[index]['likes']--;
    });
  }

  void _onShare(int index) {
    setState(() {
      filteredPosts[index]['shares']++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post Shared!')),
    );
  }

  void _addPost(String title, String subtitle, String fullContent) {
    setState(() {
      var newPost = {
        'profileUrl': 'https://img.icons8.com/?size=100&id=r6JKyoxk0mgY&format=png&color=000000',
        'name': 'New User',
        'date': 'Just now',
        'title': title,
        'subtitle': subtitle,
        'fullContent': fullContent,
        'likes': 0,
        'comments': 0,
        'shares': 0,
        'isLiked': false,
        'commentsList': [],
        'isOwner': true, 
      };

      posts.insert(0, newPost);
      filteredPosts = List.from(posts);
    });
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
      filteredPosts = List.from(posts);
    });
  }

  void _editPost(int index, String title, String subtitle, String fullContent) {
    setState(() {
      filteredPosts[index]['title'] = title;
      filteredPosts[index]['subtitle'] = subtitle;
      filteredPosts[index]['fullContent'] = fullContent;

      posts[index] = filteredPosts[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0081D7),
        title: null,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: const Text(
              'Community',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 10,),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: PostSearchDelegate(posts: posts, onSearch: filterPosts),
                );
              },
            ),
          ),
        ],
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        toolbarHeight: 80,
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredPosts.isEmpty
              ? const Center(child: Text('No posts yet. Create one!'))
              : ListView.builder(
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = filteredPosts[index];
                    post['isOwner'] ??= false;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailPage(post: post),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        elevation: 6, // Added shadow for the card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(post['profileUrl']),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(post['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  const Spacer(),
                                  Text(post['date'], style: const TextStyle(color: Colors.grey)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(post['title'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              Text(post['subtitle'], style: const TextStyle(fontSize: 16, color: Colors.grey)),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  // Like button and count
                                  Expanded(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            post['isLiked'] ? Icons.thumb_up : Icons.thumb_up_off_alt,
                                            color: post['isLiked'] ? Colors.blue : null,
                                          ),
                                          onPressed: () => _onLike(index),
                                        ),
                                        Text('${post['likes']}'),
                                      ],
                                    ),
                                  ),
                                  // Comment button and count
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.comment),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CommentPage(post: post),
                                              ),
                                            );
                                          },
                                        ),
                                        Text('${post['comments']}'),
                                      ],
                                    ),
                                  ),
                                  // Share button and count
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.share),
                                          onPressed: () => _onShare(index),
                                        ),
                                        Text('${post['shares']}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Edit and Delete buttons
                              post['isOwner']
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CreatePostPage(
                                                  post: post, 
                                                  isEdit: true, 
                                                  index: index, 
                                                ),
                                              ),
                                            ).then((updatedPost) {
                                              if (updatedPost != null) {
                                                _editPost(index, updatedPost['title'], updatedPost['subtitle'], updatedPost['fullContent']);
                                              }
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete, color: Colors.red),
                                          onPressed: () {
                                            _showDeleteConfirmationDialog(index);
                                          },
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostPage()),
          );
          setState(() {
            isLoading = false;
          });
          if (newPost != null) {
            _addPost(newPost['title'], newPost['subtitle'], newPost['fullContent']);
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color(0xFF0081D7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent tapping outside to dismiss
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Delete Post?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center title
                ),
                const SizedBox(height: 10),
                const Text(
                  'Are you sure you want to delete this post?',
                  textAlign: TextAlign.center, // Center message
                ),
                const SizedBox(height: 20),
                
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between buttons
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          _deletePost(index);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PostSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> posts;
  final Function onSearch;

  PostSearchDelegate({required this.posts, required this.onSearch});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearch();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredPosts = posts.where((post) {
      return post['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
          post['subtitle'].toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredPosts.isEmpty) {
      return Center(
        child: Text(
          'No results found for "$query"',
          style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return ListTile(
          title: Text(post['title']),
          subtitle: Text(post['subtitle']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailPage(post: post),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show the same results as buildResults
    return buildResults(context);
  }
}