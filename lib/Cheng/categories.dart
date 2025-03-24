import 'dart:async';
import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/TermAndCondition.dart';
import 'package:human_firewall/Lymean/Verify.dart';
import 'package:human_firewall/Lymean/Login.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _isLoading = false; // Loading state for registration

  void _validateAndSubmit() async {
    setState(() {
      _autoValidate = true;
    });

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });

      try {
        // Simulate backend API call
        await Future.delayed(const Duration(seconds: 2));

        // On success, navigate to another screen (e.g., home screen)
        Navigator.pushReplacementNamed(context, '/home'); // Example: Navigate to Home page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful!')),
        );
      } catch (e) {
        // Handle error, e.g., username/email already exists
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Wrap everything in SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelloRegisterToGetStarted(),
            const SizedBox(height: 20),
            const EnterYourPersonalInformation(),
            const SizedBox(height: 30),
            Group19(formKey: _formKey, autoValidate: _autoValidate),
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.centerLeft, // Aligns content to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text in Column to the left
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'By clicking on sign-up, you agree to our app’s',
                    style: TextStyle(
                      color: Color(0xFF6E5F5F),
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 5),
                 InkWell(
                  onTap: () {
                    // Navigate directly to Terms and Conditions Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TermAndConditions()),
                    );
                  },
                    child: const Text(
                      'Terms and Conditions of Use',
                      style: TextStyle(
                        color: Color(0xFF0081D7),
                        fontSize: 18,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.7, // Adjust thickness if needed
                        decorationColor: Color(0xFF0081D7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 350,  // Set width to 389 for consistent sizing
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () {
                    // Only navigate when the form is valid
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Verify()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0081D7),
                    minimumSize: const Size(350, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'SuezOne',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensures the Row wraps content
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Color(0xFF6E5F5F),
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate directly to Terms and Conditions Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginForm()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: const Color(0xFF0081D7),
                        fontSize: 18,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.7, // Adjust thickness if needed
                        decorationColor: Color(0xFF0081D7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Terms and Conditions'),
          content: const Text('Here goes the Terms and Conditions content...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class HelloRegisterToGetStarted extends StatelessWidget {
  const HelloRegisterToGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 387,
      child: const Text(
        'Hello ! \nRegister to get started',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'SourceSerif',
          fontWeight: FontWeight.w600,
          height: 1.56,
          letterSpacing: 2.90,
        ),
      ),
    );
  }
}

class EnterYourPersonalInformation extends StatelessWidget {
  const EnterYourPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Enter your personal information',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF6E5F5F),
        fontSize: 20,
        fontFamily: 'SourceSans',
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      ),
    );
  }
}

class Group19 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final bool autoValidate;

  const Group19({super.key, required this.formKey, required this.autoValidate});

  @override
  Group19State createState() => Group19State();
}

class Group19State extends State<Group19> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    double screenHeight = MediaQuery.of(context).size.height; // Get screen height

    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          _buildInputField(
            'Enter your username', 
            usernameController, 
            (value) {
              if (value == null || value.isEmpty) {
                return 'Username is required';
              }
              return null;
            },
            focusNode: _usernameFocus,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            'Enter your Email', 
            emailController, 
            (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
            focusNode: _emailFocus,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            'Enter your password', 
            passwordController, 
            (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              } else if (value.length < 8) {
                return 'Password must be at least 8 characters';
              } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                return 'Include at least 1 uppercase letter';
              } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                return 'Include at least 1 lowercase letter';
              } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                return 'Include at least 1 number';
              } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                return 'Include at least 1 special character';
              }
              return null;
            },
            focusNode: _passwordFocus,
            icon: IconButton(
              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            obscureText: !_isPasswordVisible,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
    String hint, TextEditingController controller, String? Function(String?) validator,
    {bool obscureText = false, IconButton? icon, FocusNode? focusNode}) {
    return SizedBox(
      width: 380,
      height: 80,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15, horizontal: 12),
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 180, 179, 179),
            fontSize: 22,
            fontFamily: 'SourceSans',
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFF0081D7),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFF0081D7),
              width: 1.8,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red, // Show red border on error
              width: 1.8,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red, // Show red border on error when focused
              width: 2.0,
            ),
          ),
          suffixIcon: icon,
        ),
        validator: validator,
        focusNode: focusNode,
      ),
    );
  }
}
