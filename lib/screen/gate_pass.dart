import 'package:flutter/material.dart';

import '../features/colors.dart';
 class GatePass extends StatefulWidget {
   const GatePass({super.key});

   @override
   State<GatePass> createState() => _GatePassState();
 }

 class _GatePassState extends State<GatePass> {
   final items = ['Computer Science', 'Mechanical', 'Electrical', 'Civil'];
   final sem = ['1st semester', '2nd semester', '3rd semester', '4th semester', '5th semester', '6th semester', '7th semester', '8th semester'];
   String? value;
   String? semesterValue;
   DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
     value: item,
     child: Text(
       item,
       style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
     ),
   );

   @override
   Widget build(BuildContext context) {
     return Container(
       color: backgroundcolor,
       child: Scaffold(
         appBar: AppBar(
           title: Text("Apply Gate Pass"),
         ),
         body: SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: 'Full Name',
                     prefixIcon: Icon(Icons.person),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: green),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Colors.black38),
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                 child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(
                       color: Colors.black38,
                       width: 1
                     ),
                   ),
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
                       value: value,
                       isExpanded: true,
                       items: items.map(buildMenuItem).toList(),
                         onChanged: (value) => setState(()
                       => this.value = value,
                         ),
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                 child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(
                         color: Colors.black38,
                         width: 1
                     ),
                   ),
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
                       value: semesterValue,
                       isExpanded: true,
                       items: sem.map(buildMenuItem).toList(),
                       onChanged: (value) => setState(()
                       => this.semesterValue = value,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           )
         ),
       )

     );
   }
 }
