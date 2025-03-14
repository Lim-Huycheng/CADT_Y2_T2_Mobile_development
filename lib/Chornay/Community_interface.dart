import 'package:flutter/material.dart';

class CommunityInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth * 0.95, // Makes sure it adapts to screen size
            height: screenHeight,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: screenWidth * 0.22,
                  top: screenHeight * 0.4,
                  child: Text(
                    'Community',
                    style: TextStyle(
                      color: Color(0xFF0081D7),
                      fontSize: screenWidth * 0.1, // Responsive text size
                      fontFamily: 'SourceSerif',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _buildImage(screenWidth * 0.1, screenHeight * 0.25, 80, "https://img.icons8.com/?size=100&id=JwQbESRFaaa1&format=png&color=0081D7"),
                _buildImage(screenWidth * 0.05, screenHeight * 0.03, 80, "https://img.icons8.com/?size=100&id=44121&format=png&color=000000"),
                _buildImage(screenWidth * 0.7, screenHeight * 0.3, 80, "https://img.icons8.com/?size=100&id=121702&format=png&color=000000"),
                _buildImage(screenWidth * 0.1, screenHeight * 0.55, 80, "https://img.icons8.com/?size=100&id=01LTWWWbK6yr&format=png&color=000000"),
                _buildImage(screenWidth * 0.4, screenHeight * 0.65, 80, "https://img.icons8.com/?size=100&id=WM8SXeEFnOV7&format=png&color=000000"),
                _buildImage(screenWidth * 0.1, screenHeight * 0.8, 70, "https://img.icons8.com/?size=79&id=LSy6l2VKR7Hz&format=png&color=000000"),
                _buildImage(screenWidth * 0.7, screenHeight * 0.75, 80, "https://img.icons8.com/?size=100&id=64204&format=png&color=000000"),
                _buildImage(screenWidth * 0.5, screenHeight * 0.1, 80, "https://img.icons8.com/?size=100&id=114890&format=png&color=000000"),
                _buildImage(screenWidth * 0.7, screenHeight * 0.55, 80, "https://img.icons8.com/?size=100&id=TCeszP0fP2DR&format=png&color=000000"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // **Reusable Function for Images with Scaled Size**
  Widget _buildImage(double left, double top, double size, String url) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
