import 'package:flutter/material.dart';
import 'package:university/features/colors.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: Text("Library",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w600,
            color: TextDarkGreen,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20, bottom: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0 ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for books, subjects, etc",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Categories",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Colors.black54
                ),),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      color: cardLightBlue,
                      ),
                        child: Center(child: Text("E-Books",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: TextDarkBlue
                        ),)),
                    ),
                    Container(
                      height: 70,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cardLightRed,
                      ),
                      child: Center(child: Text("Magazines",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: TextDarkRed
                        ),)),
                    ),
                  ],
                ),
                    SizedBox(
                      height: 20,
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cardLightOrange,
                      ),
                      child: Center(child: Text("Issued Book",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: TextDarkOrange
                        ),)),
                    ),
                    Container(
                      height: 70,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cardLightGreen1,
                      ),
                      child: Center(child: Text("Semester Book",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: green
                        ),)),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
