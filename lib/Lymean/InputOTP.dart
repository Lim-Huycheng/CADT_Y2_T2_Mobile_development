import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/Reset.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  InputOTPState createState() => InputOTPState();
}

class InputOTPState extends State<OTP> {
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
            const SizedBox(height: 30),
              SizedBox(
                width: 379,
                child: Text(
                  'Enter the verification code, \nwe just sent to your email address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SourceSans',
                    fontWeight: FontWeight.w700,
                    wordSpacing: 3,
                  ),
                ),
              ),
            const SizedBox(height: 30),
            Group19(formKey: _formKey, autoValidate: _autoValidate),
            const SizedBox(height: 100),
            ForgetSubmit(formKey: _formKey, isLoading: _isLoading),  // Pass formKey and loading state to the button
          ],
        ),
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
        child: _buildImage(70, "assets/images/OTP.jpg"), 
      ),
    );
  }

  // Method to build the image icon with size and URL
  Widget _buildImage(double size, String assetPath) {
    return Container(
      width: 250,
      height: 250,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResetPassword()),
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
                  'Continue',
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
            'Enter Verification code', 
            (value) {
              if (value == null || value.isEmpty) {
                return 'OTP is required';
              } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                return 'Enter a valid 6-digit OTP';
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
        keyboardType: TextInputType.number, // Allow only numbers
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
