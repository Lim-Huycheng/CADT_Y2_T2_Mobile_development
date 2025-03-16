import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<String> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optionally, set the display name (username)
      await userCredential.user?.updateDisplayName(username);

      // Return success message
      return 'User created successfully';
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors
      if (e.code == 'email-already-in-use') {
        return 'The email is already in use.';
      } else if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'invalid-email') {
        return 'The email address is not valid.';
      } else {
        return 'Error: ${e.message}';
      }
    } catch (e) {
      // Catch other errors
      return 'Unexpected error: $e';
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error signing in with email and password: $e');
      return null;
    }
  }

  // Sign out of Firebase
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get the current authenticated user
  User? get currentUser => _auth.currentUser;

  // Check if the user is authenticated
  bool get isAuthenticated => _auth.currentUser != null;
}
