import 'package:flutter/material.dart';
import 'package:university/features/colors.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        title: Text("Fees",
            style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87),),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        color: backgroundcolor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 6,
                color: cardLightGreen,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                  child: Column(
                    children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Payable",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black54
                            ),
                          ),
                          Text("₹ 1,80,000",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 26,
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount Paid",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black54
                            ),
                          ),
                          Text("₹ 1,75,000",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 26,
                                color: Colors.black54
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 60,
                        thickness: 2,
                        color: Colors.teal,
                        indent: 0,      // 20 pixels of space on the left
                        endIndent: 0, // 20 pixels of space on the right
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Outstanding Due",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black54
                            ),
                          ),
                          Text("₹ 5,000",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 26,
                                color: green
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: (){
                            },
                            child: Text("Pay Other Amount")),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                                onPressed: (){
                                },
                                child: Text("Pay Now")),
                      ],
                    ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("Fees Details",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.black54
                ),),
              ),
             Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 1,
                color: Colors.white,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20.0),
               ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                  child: Column(
                    children: [
                        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outlined,
                                  color: green,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text("Tuition Fees",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text("Date: 10 jun 2025",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("₹ 40,000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      color: Colors.black
                                  ),
                                ),
                                Text("Paid",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: green
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outlined,
                                color: green,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("Hostel Fees",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 23 jul 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 40,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                              Text("Paid",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: green
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.red,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("Exam Fees",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 10 aug 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 2,500",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                              Text("Due",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.red
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outlined,
                                color: green,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("Library Fees",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 15 aug 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 4,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                              Text("Paid",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: green
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.red,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("Other Fees",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 20 aug 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 2,500",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                              Text("Due",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.red
                                ),
                              ),
                            ],
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 135),
                child: Text("Transition History",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.black54
                  ),),
              ),
              Card(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.blue,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("TXNS79656",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 10 jun 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 40,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.blue,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("TXNS79657",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 23 jun 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 40,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.blue,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("TXNS79658",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Date: 15 aug 2025",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("₹ 4,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )

      ),

    );
  }
}
