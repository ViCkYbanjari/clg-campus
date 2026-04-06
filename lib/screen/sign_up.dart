import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart'; // Import the full Get package
import 'package:university/firebase/wrapper.dart';
import 'package:university/screen/login_screen.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Create a separate controller for the confirm password field
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Create a dedicated method for the sign-up logic
  void signUpUser() async {
    // Optional: Add a check to ensure passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      // Show an error message if passwords don't match
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return; // Stop the function if passwords mismatch
    }

    try {
      // Use a try-catch block to handle potential errors
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _userEmailController.text.trim(),
        // Use .text and trim whitespace
        password: _passwordController.text
            .trim(), // Use .text and trim whitespace
      );
      // Navigate to the Wrapper screen on successful sign-up
      // This line should be AFTER the await call
      Get.offAll(() => Wrapper());
    } on FirebaseAuthException catch (e) {
      // Handle errors like weak-password, email-already-in-use, etc.
      Get.snackbar(
        "Sign-Up Failed",
        e.message ?? "An unknown error occurred.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _userEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://i.pinimg.com/1200x/7a/32/58/7a3258691ac5aa4f640d7b678af84861.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    // ... your existing UI code ...
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children: [
                          // ... Full Name and Phone Number TextFields ...

                          SizedBox(height: 40),
                          TextField(
                            controller: _userEmailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                              // ... your border styles
                            ),
                          ),
                          SizedBox(height: 40),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock_outline),
                              // ... your border styles
                            ),
                          ),
                          SizedBox(height: 40),
                          TextField(
                            // Use the new controller here
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock_outline),
                              // ... your border styles
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                // Call your new signUpUser method here
                                onPressed: signUpUser,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffc76bff),
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20), // Added some space
                          // Optional: Add a button to go to the login screen
                          TextButton(
                            onPressed: () {
                              Get.off(() => Login1()); // Navigate using Get
                            },
                            child: Text(
                              "Already have an account? Login",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}