import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university/features/colors.dart';
import 'package:university/screen/home_screen.dart';
import 'package:university/screen/schedule.dart';
import 'package:university/screen/setting_page.dart';

import 'fees-screen.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final Controller = Get.put(Navigation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: Obx(()=>
        NavigationBar(
          indicatorColor: cardLightGreen,
         backgroundColor: backgroundcolor,
         indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
         height: 80,
           elevation: 0,
           selectedIndex: Controller.currentIndex.value,
           onDestinationSelected: (index)=> Controller.currentIndex.value = index,
           destinations: [
             NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
             NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: "Schedule"),
             NavigationDestination(icon: Icon(Icons.school_outlined), label: "Fees"),
             NavigationDestination(icon: Icon(Icons.settings_rounded), label: "Settings"),
           ],
        ),
     ),
      body: Obx(()=> Controller.screen[Controller.currentIndex.value]),
    );
  }
}

class Navigation extends GetxController{
  final Rx<int> currentIndex = 0.obs;
  final screen = [
    const HomeScreen(),
    const Schedule(),
    const FeesScreen(),
    const SettingPage(),
  ];
}

