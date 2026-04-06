import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../features/colors.dart' hide darkSlateGray, lightGray;
import '../features/theme.dart';
import 'Schedule_item_card.dart' hide darkSlateGray, lightGray;
import 'canteen_item.dart';

class Canteen extends StatefulWidget {
  const Canteen({super.key});

  @override
  State<Canteen> createState() => _CanteenState();
}

class _CanteenState extends State<Canteen> {
  DateTime _selectedValue = DateTime.now();

  // Your existing data map...
  final Map<int, List<CanteenItem>> _weeklySchedule = {
    DateTime.monday: [
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/1200x/64/16/73/6416733eeda35bf65bfa757d6d4c39c0.jpg',
          title: 'Samosa',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/1a/ad/74/1aad744890154a9ce05ab8445f9a132f.jpg',
          title: 'Tea',
          price: '₹ 10',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/aa/df/81/aadf81c33d7a3426c9e653f6e198e7fb.jpg',
          title: 'Veg Thali',
          price: '₹ 50', 
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/83/b7/38/83b7381b18940f97d4ec5fe69ae3d023.jpg',
          title: 'Fried Rice',
          price: '₹ 40', 
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
        imageUrl: 'https://i.pinimg.com/736x/9d/56/28/9d5628b766a9b5fb4feeb1bdab6aea37.jpg',
        title: 'Chole Bhature',
        price: '₹ 50', 
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
    ],
    DateTime.tuesday: [
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/45/d1/be/45d1be3f3cca22fe4ab70b1e98151418.jpg',
          title: 'Veg Noddles',
          price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/1a/ad/74/1aad744890154a9ce05ab8445f9a132f.jpg',
          title: 'Tea',
          price: '₹ 10',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/1200x/64/16/73/6416733eeda35bf65bfa757d6d4c39c0.jpg',
          title: 'Samosa',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/c8/15/d9/c815d9b5928a4910b1ae5bdd023524cb.jpg',
          title: 'Moong Dal Pakoda',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
    ],
    DateTime.wednesday: [
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/1200x/64/16/73/6416733eeda35bf65bfa757d6d4c39c0.jpg',
          title: 'Samosa',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/1a/ad/74/1aad744890154a9ce05ab8445f9a132f.jpg',
          title: 'Tea',
          price: '₹ 10',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/aa/df/81/aadf81c33d7a3426c9e653f6e198e7fb.jpg',
          title: 'Veg Thali',
          price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/83/b7/38/83b7381b18940f97d4ec5fe69ae3d023.jpg',
          title: 'Fried Rice',
          price: '₹ 40',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
        imageUrl: 'https://i.pinimg.com/736x/9d/56/28/9d5628b766a9b5fb4feeb1bdab6aea37.jpg',
        title: 'Chole Bhature',
        price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
    ],
    DateTime.thursday: [
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/1200x/64/16/73/6416733eeda35bf65bfa757d6d4c39c0.jpg',
          title: 'Samosa',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/1a/ad/74/1aad744890154a9ce05ab8445f9a132f.jpg',
          title: 'Tea',
          price: '₹ 10',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/aa/df/81/aadf81c33d7a3426c9e653f6e198e7fb.jpg',
          title: 'Veg Thali',
          price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/83/b7/38/83b7381b18940f97d4ec5fe69ae3d023.jpg',
          title: 'Fried Rice',
          price: '₹ 40',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
        imageUrl: 'https://i.pinimg.com/736x/9d/56/28/9d5628b766a9b5fb4feeb1bdab6aea37.jpg',
        title: 'Chole Bhature',
        price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
    ],
    DateTime.friday: [
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/1200x/64/16/73/6416733eeda35bf65bfa757d6d4c39c0.jpg',
          title: 'Samosa',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/1a/ad/74/1aad744890154a9ce05ab8445f9a132f.jpg',
          title: 'Tea',
          price: '₹ 10',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/aa/df/81/aadf81c33d7a3426c9e653f6e198e7fb.jpg',
          title: 'Veg Thali',
          price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/83/b7/38/83b7381b18940f97d4ec5fe69ae3d023.jpg',
          title: 'Fried Rice',
          price: '₹ 40',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
        imageUrl: 'https://i.pinimg.com/736x/9d/56/28/9d5628b766a9b5fb4feeb1bdab6aea37.jpg',
        title: 'Chole Bhature',
        price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
    ],
    DateTime.saturday: [
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/1200x/64/16/73/6416733eeda35bf65bfa757d6d4c39c0.jpg',
          title: 'Samosa',
          price: '₹ 20',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/1a/ad/74/1aad744890154a9ce05ab8445f9a132f.jpg',
          title: 'Tea',
          price: '₹ 10',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/aa/df/81/aadf81c33d7a3426c9e653f6e198e7fb.jpg',
          title: 'Veg Thali',
          price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
          imageUrl: 'https://i.pinimg.com/736x/83/b7/38/83b7381b18940f97d4ec5fe69ae3d023.jpg',
          title: 'Fried Rice',
          price: '₹ 40',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
      CanteenItem(
        imageUrl: 'https://i.pinimg.com/736x/9d/56/28/9d5628b766a9b5fb4feeb1bdab6aea37.jpg',
        title: 'Chole Bhature',
        price: '₹ 50',
          cardColor: Colors.transparent,
          titleColor: TextDarkOrange
      ),
    ],

  };

  @override
  Widget build(BuildContext context) {
    final List<CanteenItem> currentDaySchedule =
        _weeklySchedule[_selectedValue.weekday] ?? [];

    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Canteen Menu",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(DateFormat('dd').format(_selectedValue), style: CanteenDate),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.EEEE().format(_selectedValue),
                        style: WeekStyle),
                    Text(DateFormat('MMMM, yyyy').format(_selectedValue),
                        style: MonthYearStyle),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 70,
              initialSelectedDate: _selectedValue,
              selectionColor: TextDarkOrange,
              selectedTextColor: Colors.white,
              dateTextStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: darkSlateGray,
              ),
              dayTextStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: lightGray,
              ),
              monthTextStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: lightGray,
              ),
              onDateChange: (date) {
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: currentDaySchedule.isEmpty
                  ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restaurant_menu, size: 80, color: lightGray),
                    SizedBox(height: 16),
                    Text(
                      'Closed Today!',
                      style: TextStyle(
                          fontSize: 20,
                          color: darkSlateGray,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'No menu available.',
                      style: TextStyle(fontSize: 16, color: TextDarkOrange),
                    ),
                  ],
                ),
              )
                  : GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 0,
                  // --- DECREASED to 0.65 to make height LARGER ---
                  childAspectRatio: 0.65,
                ),
                itemCount: currentDaySchedule.length,
                itemBuilder: (context, index) {
                  final item = currentDaySchedule[index];
                  return CanteenItemCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}