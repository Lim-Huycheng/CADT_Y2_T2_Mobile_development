import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/InputOTP.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  ForgetState createState() => ForgetState();
}

class ForgetState extends State<Forget> {
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

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful!')),
        );
      } catch (e) {
        // Handle error (e.g., username/email already exists)
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ForgetPassword(),  
            const SizedBox(height: 10),
            Title(),
            const SizedBox(height: 30),
              SizedBox(
                width: 379,
                child: Text(
                  'Enter your registered email to reset \nyour password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SourceSans',
                    fontWeight: FontWeight.w700,
                    wordSpacing: 3,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Group19(formKey: _formKey, autoValidate: _autoValidate),
            const SizedBox(height: 80),
            ForgetSubmit(formKey: _formKey, isLoading: _isLoading),  // Pass formKey and loading state to the button
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 402,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Forget Password?',
              style: TextStyle(
                color: const Color(0xFF0081D7),
                fontSize: 30,
                fontFamily: 'Source Serif Pro',
                fontWeight: FontWeight.w600,
                letterSpacing: 3.80,
              ),
            ),
            TextSpan(
              text: ' \n',
              style: TextStyle(
                color: const Color(0xFF0081D7),
                fontSize: 35,
                fontFamily: 'Source Serif Pro',
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
            ),
            TextSpan(
              text: 'It’s Okay !\nDo Not Worry !',
              style: TextStyle(
                color: const Color(0xFFFF8B2D),
                fontSize: 25,
                fontFamily: 'Source Serif Pro',
                fontWeight: FontWeight.w600,
                letterSpacing: 3.60,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0), 
        child: _buildImage(70, "assets/images/ForgetPassword.jpg"), 
      ),
    );
  }

  // Method to build the image icon with size and URL
  Widget _buildImage(double size, String assetPath) {
    return Container(
      width: 150,
      height: 150,
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.cover, // Ensures the image covers the container
      ),
    );
  }
}

class ForgetSubmit extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isLoading;

  const ForgetSubmit({required this.formKey, required this.isLoading, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250, // Set width to 350 for consistent sizing
        height: 55,
        child: ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  // Only navigate when the form is valid
                  if (formKey.currentState!.validate()) {
                    // Simulating some async operation like an API call
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OTP()),
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
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'SuezOne',
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}

class Group19 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool autoValidate;

  const Group19({super.key, required this.formKey, required this.autoValidate});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildInputField(
            'Enter your Email', 
            (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint, String? Function(String?) validator) {
    return SizedBox(
      width: 380,
      height: 80,
      child: TextFormField(
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
        ),
        validator: validator,
      ),
    );
  }
}
