import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
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
            const SizedBox(height: 10),
            const EnterYourPersonalInformation(),
            const SizedBox(height: 10),
            Group19(formKey: _formKey, autoValidate: _autoValidate),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _validateAndSubmit,
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Register'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  _showTermsAndConditionsDialog();
                },
                child: const Text(
                  'By clicking Sign Up, you agree to our app’s Terms and Conditions of Use',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: InkWell(
                onTap: () {
                  // Navigate to Login Screen
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Already have an account? Login Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          _buildInputField('Enter your username', usernameController, (value) {
            if (value == null || value.isEmpty) {
              return 'Username is required';
            }
            return null;
          }),
          const SizedBox(height: 10),
          _buildInputField('Enter your Email', emailController, (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          }),
          const SizedBox(height: 10),
          _buildInputField('Enter your password', passwordController, (value) {
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
          }, obscureText: true),
          const SizedBox(height: 10),
          _buildInputField('Confirm your password', confirmPasswordController, (value) {
            if (value == null || value.isEmpty) {
              return 'Confirm password is required';
            } else if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          }, obscureText: true),
        ],
      ),
    );
  }

  Widget _buildInputField(
      String hint, TextEditingController controller, String? Function(String?) validator,
      {bool obscureText = false}) {
    return SizedBox(
      width: 357,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 18,
            fontFamily: 'SourceSans',
            letterSpacing: 1.5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF0081D7),
              width: 2,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
