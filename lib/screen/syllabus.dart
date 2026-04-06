import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university/pdf/computer_network.dart';
import 'package:university/pdf/flat.dart';
import 'package:university/pdf/laboratory.dart';
import 'package:university/pdf/microprocessors_pdf.dart';
import 'package:university/pdf/ooad.dart';
import 'package:university/pdf/python.dart';

import '../features/colors.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: Text("Syllabus",
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w600,
          color: TextDarkYellow,
        ),),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top:15,bottom: 20),
          child: Column(
            children: [
              Text("Semester V - Computer Science",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.black
                ),
              ),
              SizedBox(
                height: 10,
              ),
                 Card(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  elevation: 0.1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Microprocessors()
                      )
                      );
                    },
                      child: Padding(
                         padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: cardLightYellow,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Icon(
                                      Icons.book_outlined,
                                      size: 30,
                                      color: TextDarkYellow
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                    Text("Microprocessors \n& Interfaces",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.black
                                      ),
                                    ),
                              ],
                            ),
                                Icon(Icons.keyboard_arrow_right_outlined,
                                color: Colors.black45,
                                size: 30,)
                          ],
                        ),
                      ),
        
                ),
              ),
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 0.1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ComputerNetwork()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: cardLightYellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                  Icons.book_outlined,
                                  size: 30,
                                  color: TextDarkYellow
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Computer Networks",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined,
                          color: Colors.black45,
                          size: 30,)
                      ],
                    ),
                  ),
        
                ),
              ),
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 0.1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Flat()));
        
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: cardLightYellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                  Icons.book_outlined,
                                  size: 30,
                                  color: TextDarkYellow
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Formal Languages \n& Automata Theory",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined,
                          color: Colors.black45,
                          size: 30,)
                      ],
                    ),
                  ),
        
                ),
              ),
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 0.1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Python()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: cardLightYellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                  Icons.book_outlined,
                                  size: 30,
                                  color: TextDarkYellow
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Data Analytics with\n PYTHON",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined,
                          color: Colors.black45,
                          size: 30,)
                      ],
                    ),
                  ),
        
                ),
              ),
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 0.1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ObjectOriented()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: cardLightYellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                  Icons.book_outlined,
                                  size: 30,
                                  color: TextDarkYellow
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Object Oriented \nAnalysis & Design",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined,
                          color: Colors.black45,
                          size: 30,)
                      ],
                    ),
                  ),
        
                ),
              ),
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 0.1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Laboratory()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: cardLightYellow,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                  Icons.book_outlined,
                                  size: 30,
                                  color: TextDarkYellow
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Laboratory ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined,
                          color: Colors.black45,
                          size: 30,)
                      ],
                    ),
                  ),
        
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
