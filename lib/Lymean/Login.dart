import 'dart:async';
import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/Verify.dart';
import 'package:human_firewall/Lymean/Signup.dart';
import 'package:human_firewall/Lymean/ForgetPassword.dart';
import 'package:human_firewall/Lymean/homescreen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _isLoading = false;

  void _validateAndSubmit() async {
    setState(() {
      _autoValidate = true;
    });

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await Future.delayed(const Duration(seconds: 2));

        Navigator.pushReplacementNamed(context, '/home');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CombinedGroup()), // Replace with your target screen
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigStar(),  
            const SizedBox(height: 10),
            const WelcomeBack(),
            const SizedBox(height: 20),
            Group19(formKey: _formKey, autoValidate: _autoValidate),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 20), 
              child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Forget()),
                  );
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color(0xFF0081D7),
                    fontSize: 18,
                    fontFamily: 'SourceSans',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
            const SizedBox(height: 40),
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
                    backgroundColor: const Color(0xFFFF8B2D),
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
                          'Login',
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
                    "Don't have an account? ",
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
                        MaterialPageRoute(builder: (context) => const RegistrationForm()),
                      );
                    },
                    child: const Text(
                      'Sign up',
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
}

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 387,
      child: const Text(
        'Welcome back !\nGlad to see you, again ! ',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'SourceSerif',
          fontWeight: FontWeight.w600,
          height: 1.56,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class BigStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0), // Moves the image down
        child: _buildImage(70, "assets/images/login.jpg"), // Use local asset path
      ),
    );
  }

  // Method to build the image icon with size and URL
  Widget _buildImage(double size, String assetPath) {
    return Container(
      width: 200,
      height: 200,
        child: Image.asset(
          assetPath,
          width: size,
          height: size,
          fit: BoxFit.cover, // Ensures the image covers the container
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
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          // Username input field
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
            nextFocusNode: _passwordFocus,
          ),
          
          const SizedBox(height: 20),

          // Password input field
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
            obscureText: !_isPasswordVisible,
            icon: IconButton(
              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
  String hint,
  TextEditingController controller,
  String? Function(String?) validator, {
  bool obscureText = false,
  IconButton? icon,
  FocusNode? focusNode,
  FocusNode? nextFocusNode,
}) {
  return SizedBox(
    width: 380,  // Width of the input field box
    height: 80,  // Height to maintain a box-like shape
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
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 180, 179, 179),
          fontSize: 22,
          fontFamily: 'SourceSans',
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),  // Rounded corners
          borderSide: const BorderSide(
            color: Color(0xFF0081D7),  // Blue border color
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),  // Rounded corners
          borderSide: const BorderSide(
            color: Color(0xFF0081D7),  // Blue border color when focused
            width: 1.8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),  // Rounded corners
          borderSide: const BorderSide(
            color: Colors.red,  // Red border on error
            width: 1.8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),  // Rounded corners
          borderSide: const BorderSide(
            color: Colors.red,  // Red border on error when focused
            width: 2.0,
          ),
        ),
        suffixIcon: icon,
      ),
      validator: validator,
      focusNode: focusNode,
      textInputAction: nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
    ),
  );
}
}