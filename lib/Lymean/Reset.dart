import 'package:flutter/material.dart';
import 'package:human_firewall/Lymean/ResetSuccessful.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
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
          Center(  // Corrected this
            child: Text(
              "Create new password",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                fontFamily: 'SourceSerif',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Group19(formKey: _formKey, autoValidate: _autoValidate),
          const SizedBox(height: 70),
          ForgetSubmit(formKey: _formKey, isLoading: _isLoading),  
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
        child: _buildImage(70, "assets/images/reset.jpg"), 
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
                        MaterialPageRoute(builder: (context) => const Successful()),
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

class Group19 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final bool autoValidate;

  const Group19({super.key, required this.formKey, required this.autoValidate});

  @override
  Group19State createState() => Group19State();
}

class Group19State extends State<Group19> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          _buildInputField(
            'Enter your password',
            passwordController,
            validatePassword,
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
          const SizedBox(height: 20),
          _buildInputField(
            'Confirm your password',
            confirmPasswordController,
            validateConfirmPassword, // Calls validation dynamically
            focusNode: _confirmPasswordFocus,
            icon: IconButton(
              icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
            ),
            obscureText: !_isConfirmPasswordVisible,
          ),
        ],
      ),
    );
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Include at least 1 uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(value)) return 'Include at least 1 lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Include at least 1 number';
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) return 'Include at least 1 special character';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  Widget _buildInputField(
    String hint,
    TextEditingController controller,
    String? Function(String?) validator, {
    bool obscureText = false,
    IconButton? icon,
    FocusNode? focusNode,
  }) {
    return SizedBox(
      width: 380,
      height: 80,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
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
        onChanged: (value) {
          if (controller == confirmPasswordController) {
            setState(() {}); // Triggers validation in real-time for confirmation field
          }
        },
      ),
    );
  }
}
