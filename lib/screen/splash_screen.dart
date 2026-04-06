import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university/features/colors.dart';
import 'package:university/screen/login_screen.dart';
import 'package:university/screen/bottom_navigation.dart';

class CampusYatraSplach extends StatefulWidget {
  const CampusYatraSplach({super.key});

  @override
  State<CampusYatraSplach> createState() => _CampusYatraSplachState();
}

class _CampusYatraSplachState extends State<CampusYatraSplach> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatusAndNavigate();
  }

  Future<void> _checkLoginStatusAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login1()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
        child: Container(
          height: 250,
          width: 270,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logos/logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
