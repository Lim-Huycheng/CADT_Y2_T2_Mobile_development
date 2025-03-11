import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloRegisterToGetStarted(),
              const SizedBox(height: 20),
              const EnterYourPersonalInformation(),
              const SizedBox(height: 20),
              Group19(formKey: _formKey),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If form is valid, proceed with submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data...')),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
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
        'Hello ! \nRegister to get started ',
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontFamily: 'SourceSerif',
          fontWeight: FontWeight.w600,
          height: 1.56,
          letterSpacing: 3.20,
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
  const Group19({super.key, required this.formKey});

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
    return Column(
      children: [
        _buildInputField('Enter your username', usernameController, (value) {
          if (value == null || value.isEmpty) {
            return 'Username is required';
          }
          return null;
        }),
        const SizedBox(height: 20),
        _buildInputField('Enter your Email', emailController, (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        }),
        const SizedBox(height: 20),
        _buildInputField('Enter your password', passwordController, (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        }, obscureText: true),
        const SizedBox(height: 20),
        _buildInputField('Confirm your password', confirmPasswordController, (value) {
          if (value == null || value.isEmpty) {
            return 'Confirm password is required';
          } else if (value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        }, obscureText: true),
      ],
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
          hintStyle: TextStyle(
            // ignore: deprecated_member_use
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
