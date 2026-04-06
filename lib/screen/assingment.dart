import 'package:flutter/material.dart';
import 'package:university/features/colors.dart';

class Assingment extends StatefulWidget {
  const Assingment({super.key});

  @override
  State<Assingment> createState() => _AssingmentState();
}

class _AssingmentState extends State<Assingment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
      backgroundColor: backgroundcolor,
        title: Text("Assingment"),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
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
