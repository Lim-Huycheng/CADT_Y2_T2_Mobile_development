import 'package:flutter/material.dart';
import 'addfavorite.dart';

class buildNotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String notificationText;
  final String imagePath;

  const buildNotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.notificationText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 394,
      height: 86,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Profile Picture
              Positioned(
                left: 5,
                top: 17,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    image: DecorationImage(
                      image: AssetImage(imagePath), // Image set dynamically
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

          // Title & Subtitle
          Positioned(
            left: 77,
            top: 11,
            child: SizedBox(
              width: 250,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: 'SourceSans'),
                  children: [
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: '  $subtitle',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Notification Text
          Positioned(
            left: 77,
            top: 35,
            child: SizedBox(
              width: 260,
              child: Text(
                notificationText,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          // Add Icon
          Positioned(
            right: 5,
            top: 20,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notitest1(),
                  ),
                );
              },
              icon: const Icon(Icons.add, color: Color.fromARGB(255, 96, 95, 95)),
              
            ),
          ),
        ],
      ),
    );
  }
}
