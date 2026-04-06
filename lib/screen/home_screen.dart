import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:university/features/colors.dart';
import 'package:university/screen/Library.dart';
import 'package:university/screen/assingment.dart';
import 'package:university/screen/attendance.dart';
import 'package:university/screen/canteen.dart';
import 'package:university/screen/gallery.dart';
import 'package:university/screen/notes.dart';
import 'package:university/screen/student_gatepass.dart';
import 'package:university/screen/syllabus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Get the name, or default to "User" if null/empty
      String? storedName = prefs.getString('fullName');
      if (storedName != null && storedName.isNotEmpty) {
        userName = storedName;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundcolor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: backgroundcolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Campus Yatra ",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                    color: green,
                  ),
                ),
              ),
              Icon(Icons.notifications_none_sharp, color: Color(0xff166534),
              size: 30,),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 370,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      // Replace with user image if available
                      child: Icon(Icons.person, size: 40),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Welcome, \n$userName" ,
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              CarouselSlider(
                  items: images.map((item)=> Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(item),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
              ).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enlargeCenterPage: true,
                   viewportFraction: 0.8,
                    onPageChanged: (index, reason){
                      setState(() {
                        currentIndex = index;
                      });
                    }
              )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((item)=> Container(
                  height: 12,
                  width: 12,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == item.key ? green : Colors.grey,
                  ),
                )).toList()
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 160),
                child: Text("Your Dashboard",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Colors.black54
                ),),
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Attendance()));
                      },
                      child: Container(
                        height: 135,
                        width: 170,
                        decoration: BoxDecoration(
                        color: cardLightGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: backgroundcolor,
                                  shape: BoxShape.circle,
                              ),
                                child: Icon(
                                  Icons.checklist_sharp,
                                  size: 37,
                                  color: green,
                                ),
                              ),
                              Text("Attendance",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: green
                              ),)
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  // enableFeedback: true,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Syllabus()));
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                        height: 135,
                        width: 170,
                        decoration: BoxDecoration(
                          color: cardLightYellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: backgroundcolor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.my_library_books_rounded,
                                  size: 37,
                                  color: TextDarkYellow
                                ),
                              ),
                              Text("Syllabus",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: TextDarkYellow
                                ),)
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    // enableFeedback: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Assingment()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          height: 135,
                          width: 170,
                          decoration: BoxDecoration(
                            color: cardLightBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.assignment_outlined,
                                    size: 37,
                                    color: TextDarkBlue
                                  ),
                                ),
                                Text("Assignments",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: TextDarkBlue
                                  ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    // enableFeedback: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          height: 135,
                          width: 170,
                          decoration: BoxDecoration(
                            color: cardLightOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.edit_note_sharp,
                                    size: 37,
                                    color: TextDarkOrange
                                  ),
                                ),
                                Text("Notes",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: TextDarkOrange
                                  ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    // enableFeedback: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Library()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          height: 135,
                          width: 170,
                          decoration: BoxDecoration(
                            color: cardLightGreen1,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.menu_book_outlined,
                                    size: 37,
                                    color: TextDarkGreen
                                  ),
                                ),
                                Text("Library",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: TextDarkGreen
                                  ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    // enableFeedback: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          height: 135,
                          width: 170,
                          decoration: BoxDecoration(
                            color: cardLightBlue1,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.photo_library_outlined,
                                    size: 37,
                                    color: TextDarkBlue1
                                  ),
                                ),
                                Text("Gallery",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: TextDarkBlue1
                                  ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    // enableFeedback: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentGatepass()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          height: 135,
                          width: 170,
                          decoration: BoxDecoration(
                            color: cardLightGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                      Icons.lock_outline,
                                      size: 37,
                                      color: TextDarkGreen
                                  ),
                                ),
                                Text("Gate Pass",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: TextDarkGreen
                                  ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    // enableFeedback: true,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Canteen()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          height: 135,
                          width: 170,
                          decoration: BoxDecoration(
                            color: cardLightOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: backgroundcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                      Icons.fastfood_outlined,
                                      size: 37,
                                      color: TextDarkOrange
                                  ),
                                ),
                                Text("Canteen",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: TextDarkOrange
                                  ),)
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
