import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university/features/colors.dart';
import 'package:university/screen/bottom_navigation.dart';
import 'package:university/screen/forget_page.dart';
import 'package:flutter/material.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

bool password = true;

class _Login1State extends State<Login1> {
  final semester = [
    '1st semester',
    '2nd semester',
    '3rd semester',
    '4th semester',
    '5th semester',
    '6th semester',
    '7th semester',
    '8th semester'
  ];
  String? semesterValue;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    ),
  );

  // --- 1. Added Controller for Name ---
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    // Basic Validation to ensure Name and Semester are filled
    if (_fullNameController.text.isEmpty || semesterValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your Name and select a Semester.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _userEmailController.text.trim(),
          password: _passwordController.text.trim());

      // --- 2. Save Name and Semester to SharedPreferences ---
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', _userEmailController.text.trim());

      // Saving the Name
      await prefs.setString('fullName', _fullNameController.text.trim());
      // Saving the Semester
      await prefs.setString('semester', semesterValue!);

      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
              (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'invalid-credential' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        errorMessage = 'Invalid email or password. Please try again.';
      } else {
        errorMessage = 'An error occurred. Please try again later.';
      }
      print('Firebase Auth Error: ${e.code}');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundcolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Campus Yatra',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: green,
                    ),
                  ),
                ),
                Text(
                  'Login to access your dashboard.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        right: 20,
                        left: 20,
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 80,
                                  child: Image.asset('assets/logos/logo.png')),
                              SizedBox(height: 40),

                              // --- 3. Connected Controller to Name TextField ---
                              TextField(
                                controller: _fullNameController,
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  prefixIcon: Icon(Icons.person),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: green),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.black38),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black38, width: 1),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: semesterValue,
                                    isExpanded: true,
                                    hint: Text("Select Semester"), // Added Hint
                                    items: semester.map(buildMenuItem).toList(),
                                    onChanged: (value) => setState(
                                          () => this.semesterValue = value,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _userEmailController,
                                decoration: InputDecoration(
                                  hintText: 'Student ID / Email',
                                  prefixIcon: Icon(Icons.email_outlined),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: green),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.black38),
                                  ),
                                ),
                                enabled: !_isLoading,
                              ),
                              SizedBox(height: 30),
                              TextField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                obscureText: password,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outline),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.black38),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      password
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        password = !password;
                                      });
                                    },
                                  ),
                                ),
                                enabled: !_isLoading,
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ForgotPage(),
                                        ),
                                      );
                                    },
                                    child: Text('Forgot Password?'),
                                  ),
                                  _isLoading
                                      ? const CircularProgressIndicator()
                                      : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: green,
                                        fixedSize: Size(100, 42),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadiusGeometry
                                              .circular(10),
                                        )),
                                    onPressed: (() => login()),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}