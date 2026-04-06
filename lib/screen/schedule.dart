import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:university/features/colors.dart' show backgroundcolor, green, cardLightGreen, cardLightYellow, cardLightBlue, cardLightOrange, cardLightBlue1, cardLightGreen1, TextDarkYellow, TextDarkBlue, TextDarkOrange, TextDarkBlue1, TextDarkGreen, cardLightRed, TextDarkRed;

import '../features/colors.dart' show backgroundcolor, green, cardLightGreen, cardLightYellow, cardLightBlue;
import 'schedule_item_card.dart'; 


const TextStyle DateStyle = TextStyle(
  fontSize: 52,
  fontWeight: FontWeight.bold,
  color: green,
);

const TextStyle WeekStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: darkSlateGray,
);

const TextStyle MonthYearStyle = TextStyle(
  fontSize: 16,
  color: lightGray,
);



class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _selectedValue = DateTime.now();

  final Map<int, List<ScheduleItem>> _weeklySchedule = {
    DateTime.monday: [
      ScheduleItem(
        startTime: '09:50',
        endTime: '10:50',
        title: 'Object Oriented Analysis\n& Design',
        room: 'Room EB - 201',
        professor: 'Mrs. Ojaswi Banchhor ',
        cardColor: cardLightGreen,
        titleColor: green,
      ),
      ScheduleItem(
        startTime: '10:50',
        endTime: '11:45',
        title: 'Data Analytics with\n Python',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightYellow,
        titleColor: TextDarkYellow
      ),
      ScheduleItem(
        startTime: '11:45',
        endTime: '12:40',
        title: 'Computer Network\n ',
        room: 'Room EB - 201',
        professor: 'Mrs. Ashwini Gawande ',
        cardColor: cardLightBlue,
          titleColor: TextDarkBlue
      ),
      ScheduleItem(
        startTime: '12:40',
        endTime: '01:30',
        title: 'Lunch Time\n',
        room: 'Canteen',
        professor: 'Student & Faculty',
        cardColor: cardLightOrange,
          titleColor: TextDarkOrange
      ),
      ScheduleItem(
        startTime: '01:30',
        endTime: '02:20',
        title: 'Formal Languages and\nAutomata Theory',
        room: 'Room EB - 201',
        professor: 'Mrs. Chetana ',
        cardColor: cardLightBlue1,
          titleColor: TextDarkBlue1
      ),
      ScheduleItem(
        startTime: '02:20',
        endTime: '04:00',
        title: 'Microprocessor & Interfaces\n Laboratory',
        room: 'Lab 1',
        professor: 'Mrs. Richa Shrivastav ',
        cardColor: cardLightGreen1,
          titleColor: TextDarkGreen
      ),
    ],
    DateTime.tuesday: [
      ScheduleItem(
        startTime: '09:50',
        endTime: '10:50',
        title: 'Data Analytics with\n Python',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightGreen,
          titleColor: green
      ),
      ScheduleItem(
        startTime: '10:50',
        endTime: '11:45',
        title: 'Computer Network\n ',
        room: 'Room EB - 201',
        professor: 'Mrs. Ashwini Gawande ',
        cardColor: cardLightYellow,
          titleColor: TextDarkYellow
      ),
      ScheduleItem(
        startTime: '11:45',
        endTime: '12:40',
        title: 'Formal Languages and\nAutomata Theory',
        room: 'Room EB - 201',
        professor: 'Mrs. Chetana ',
        cardColor: cardLightBlue,
          titleColor: TextDarkBlue
      ),
      ScheduleItem(
        startTime: '12:40',
        endTime: '01:30',
        title: 'Lunch Time\n',
        room: 'Canteen',
        professor: 'Student & Faculty',
        cardColor: cardLightOrange,
          titleColor: TextDarkOrange
      ),
      ScheduleItem(
        startTime: '01:30',
        endTime: '02:20',
        title: 'Microprocessor & Interfaces\n ',
        room: 'Room EB - 201',
        professor: 'Mrs. Richa Shrivastav ',
        cardColor: cardLightBlue1,
          titleColor: TextDarkBlue1
      ),
      ScheduleItem(
        startTime: '02:20',
        endTime: '04:00',
        title: 'Data Analytics with Python\n Laboratory',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightGreen1,
          titleColor: TextDarkGreen
      ),
    ],
    DateTime.wednesday: [
      ScheduleItem(
        startTime: '09:50',
        endTime: '10:50',
        title: 'Data Analytics with\n Python',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightGreen,
          titleColor: green
      ),
      ScheduleItem(
        startTime: '10:50',
        endTime: '11:45',
        title: 'Microprocessor & Interfaces\n',
        room: 'Room EB - 201',
        professor: 'Mrs. Richa Shrivastav ',
        cardColor: cardLightYellow,
          titleColor: TextDarkYellow
      ),
      ScheduleItem(
        startTime: '11:45',
        endTime: '12:40',
        title: 'Computer Network\n ',
        room: 'Room EB - 201',
        professor: 'Mrs. Ashwini Gawande ',
        cardColor: cardLightBlue,
          titleColor: TextDarkBlue
      ),
      ScheduleItem(
        startTime: '12:40',
        endTime: '01:30',
        title: 'Lunch Time\n',
        room: 'Canteen',
        professor: 'Student & Faculty',
        cardColor: cardLightOrange,
          titleColor: TextDarkOrange
      ),
      ScheduleItem(
        startTime: '01:30',
        endTime: '02:20',
        title: 'Object Oriented Analysis\n& Design',
        room: 'Room EB - 201',
        professor: 'Mrs. Ojaswi Banchhor ',
        cardColor: cardLightBlue1,
          titleColor: TextDarkBlue1
      ),
      ScheduleItem(
        startTime: '02:20',
        endTime: '04:00',
        title: 'Computer Network\n Laboratory',
        room: 'Lab 1',
        professor: 'Mrs. Ashwini Gawande ',
        cardColor: cardLightGreen1,
          titleColor: TextDarkGreen
      ),
    ],
    DateTime.thursday: [
      ScheduleItem(
        startTime: '09:50',
        endTime: '10:50',
        title: 'Object Oriented Analysis\n& Design',
        room: 'Room EB - 201',
        professor: 'Mrs. Ojaswi Banchhor ',
        cardColor: cardLightGreen,
          titleColor: green
      ),
      ScheduleItem(
        startTime: '10:50',
        endTime: '11:45',
        title: 'Computer Network\n ',
        room: 'Room EB - 201',
        professor: 'Mrs. Ashwini Gawande ',
        cardColor: cardLightYellow,
          titleColor: TextDarkYellow
      ),
      ScheduleItem(
        startTime: '11:45',
        endTime: '12:40',
        title: 'Formal Languages and\nAutomata Theory',
        room: 'Room EB - 201',
        professor: 'Mrs. Chetana ',
        cardColor: cardLightBlue,
          titleColor: TextDarkBlue
      ),
      ScheduleItem(
        startTime: '12:40',
        endTime: '01:30',
        title: 'Lunch Time\n',
        room: 'Canteen',
        professor: 'Student & Faculty',
        cardColor: cardLightOrange,
          titleColor: TextDarkOrange
      ),
      ScheduleItem(
        startTime: '01:30',
        endTime: '02:20',
        title: 'Data Analytics with\n Python',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightBlue1,
          titleColor: TextDarkBlue1
      ),
      ScheduleItem(
        startTime: '02:20',
        endTime: '03:10',
        title: 'Microprocessor & Interfaces\n',
        room: 'Room EB - 201',
        professor: 'Mrs. Richa Shrivastav ',
        cardColor: cardLightGreen1,
          titleColor: TextDarkGreen
      ),
      ScheduleItem(
        startTime: '03:10',
        endTime: '04:00',
        title: 'Library\n',
        room: 'Upstairs Of Canteen',
        professor: 'Student',
        cardColor: cardLightRed,
          titleColor: TextDarkRed
      ),
    ],
    DateTime.friday: [
      ScheduleItem(
        startTime: '09:50',
        endTime: '10:50',
        title: 'Formal Languages and\nAutomata Theory',
        room: 'Room EB - 201',
        professor: 'Mrs. Chetana ',
        cardColor: cardLightGreen,
          titleColor: green
      ),
      ScheduleItem(
        startTime: '10:50',
        endTime: '11:45',
        title: 'Object Oriented Analysis\n& Design',
        room: 'Room EB - 201',
        professor: 'Mrs. Ojaswi Banchhor ',
        cardColor: cardLightYellow,
          titleColor: TextDarkYellow
      ),
      ScheduleItem(
        startTime: '11:45',
        endTime: '12:40',
        title: 'Data Analytics with\n Python',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightBlue,
          titleColor: TextDarkBlue
      ),
      ScheduleItem(
        startTime: '12:40',
        endTime: '01:30',
        title: 'Lunch Time\n',
        room: 'Canteen',
        professor: 'Student & Faculty',
        cardColor: cardLightOrange,
          titleColor: TextDarkOrange
      ),
      ScheduleItem(
        startTime: '01:30',
        endTime: '02:20',
        title: 'Microprocessor & Interfaces\n',
        room: 'Room EB - 201',
        professor: 'Mrs. Richa Shrivastav ',
        cardColor: cardLightBlue1,
          titleColor: TextDarkBlue1
      ),
      ScheduleItem(
        startTime: '02:20',
        endTime: '03:10',
        title: 'Computer Network\n ',
        room: 'Room EB - 201',
        professor: 'Mrs. Ashwini Gawande ',
        cardColor: cardLightGreen1,
          titleColor: TextDarkGreen
      ),
      ScheduleItem(
        startTime: '03:10',
        endTime: '04:00',
        title: 'Seminar\n ',
        room: 'Seminar Room',
        professor: 'Student',
          cardColor: cardLightRed,
          titleColor: TextDarkRed
      ),
    ],
    DateTime.saturday: [
      ScheduleItem(
        startTime: '09:50',
        endTime: '10:50',
        title: 'Object Oriented Analysis\n& Design',
        room: 'Room EB - 201',
        professor: 'Mrs. Ojaswi Banchhor ',
        cardColor: cardLightGreen,
          titleColor: green
      ),
      ScheduleItem(
        startTime: '10:50',
        endTime: '11:45',
        title: 'Data Analytics with\n Python',
        room: 'Room EB - 201',
        professor: '  Mr. Vinayak Mulay',
        cardColor: cardLightYellow,
          titleColor: TextDarkYellow
      ),
      ScheduleItem(
        startTime: '11:45',
        endTime: '12:40',
        title: 'Microprocessor & Interfaces\n',
        room: 'Room EB - 201',
        professor: 'Mrs. Richa Shrivastav ',
        cardColor: cardLightBlue,
          titleColor: TextDarkBlue
      ),
      ScheduleItem(
        startTime: '12:40',
        endTime: '01:30',
        title: 'Lunch Time\n',
        room: 'Canteen',
        professor: 'Student & Faculty',
        cardColor: cardLightOrange,
          titleColor: TextDarkOrange
      ),
      ScheduleItem(
        startTime: '01:30',
        endTime: '02:20',
        title: 'Formal Languages and\nAutomata Theory',
        room: 'Room EB - 201',
        professor: 'Mrs. Chetana ',
        cardColor: cardLightBlue1,
          titleColor: TextDarkBlue1
      ),
      ScheduleItem(
        startTime: '02:20',
        endTime: '04:00',
        title: 'Project Lab \n ',
        room: 'Lab 1',
        professor: 'Student ',
        cardColor: cardLightGreen1,
          titleColor: TextDarkGreen
      ),
    ],

  };

  @override
  Widget build(BuildContext context) {
    final List<ScheduleItem> currentDaySchedule =
        _weeklySchedule[_selectedValue.weekday] ?? [];

    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Schedule",
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
                Text(DateFormat('dd').format(_selectedValue), style: DateStyle),
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
              selectionColor: green,
              selectedTextColor: Colors.white,
              dateTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: darkSlateGray,
              ),
              dayTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: lightGray,
              ),
              monthTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
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
                    Icon(Icons.beach_access, size: 80, color: lightGray),
                    SizedBox(height: 16),
                    Text(
                      'It\'s a Holiday!',
                      style: TextStyle(
                          fontSize: 20,
                          color: darkSlateGray,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'No classes scheduled for today.',
                      style: TextStyle(fontSize: 16, color: lightGray),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: currentDaySchedule.length,
                itemBuilder: (context, index) {
                  final item = currentDaySchedule[index];
                  return ScheduleItemCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
