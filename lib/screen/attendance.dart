import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:university/features/colors.dart';

class MonthlyAttendanceReport {
  final int presentDays;
  final int absentDays;
  final double presencePercentage;
  final List<DateTime> specificAbsentDatesInMonth;
  final DateTime reportedMonth;

  MonthlyAttendanceReport({
    required this.presentDays,
    required this.absentDays,
    required this.presencePercentage,
    required this.specificAbsentDatesInMonth,
    required this.reportedMonth,
  });
}

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

enum DayStatus { none, present, absent }

class _AttendanceState extends State<Attendance> {
  bool isSameMonth(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) {
      return false;
    }
    return date1.year == date2.year && date1.month == date2.month;
  }

  final List<DateTime> _presentDates = [
    DateTime(2025, 06, 2),
    DateTime(2025, 06, 3),
    DateTime(2025, 06, 4),
    DateTime(2025, 06, 5),
    DateTime(2025, 06, 6),
    DateTime(2025, 06, 9),
    DateTime(2025, 06, 10),
    DateTime(2025, 06, 11),
    DateTime(2025, 06, 13),
    DateTime(2025, 06, 16),
    DateTime(2025, 06, 17),
    DateTime(2025, 06, 19),
    DateTime(2025, 06, 20),
    DateTime(2025, 06, 21),
    DateTime(2025, 06, 23),
    DateTime(2025, 06, 25),
    DateTime(2025, 06, 26),
    DateTime(2025, 06, 27),
    DateTime(2025, 06, 28),

    DateTime(2025, 07, 1),
    DateTime(2025, 07, 2),
    DateTime(2025, 07, 3),
    DateTime(2025, 07, 4),
    DateTime(2025, 07, 5),
    DateTime(2025, 07, 7),
    DateTime(2025, 07, 8),
    DateTime(2025, 07, 9),
    DateTime(2025, 07, 10),
    DateTime(2025, 07, 11),
    DateTime(2025, 07, 12),
    DateTime(2025, 07, 17),
    DateTime(2025, 07, 19),
    DateTime(2025, 07, 23),
    DateTime(2025, 07, 22),
    DateTime(2025, 07, 26),
    DateTime(2025, 07, 28),
    DateTime(2025, 07, 29),

    DateTime(2025, 08, 1),
    DateTime(2025, 08, 2),
    DateTime(2025, 08, 4),
    DateTime(2025, 08, 5),
    DateTime(2025, 08, 8),
    DateTime(2025, 08, 6),
    DateTime(2025, 08, 7),
    DateTime(2025, 08, 9),
    DateTime(2025, 08, 12),
    DateTime(2025, 08, 11),
    DateTime(2025, 08, 13),
    DateTime(2025, 08, 19),
    DateTime(2025, 08, 20),
    DateTime(2025, 08, 21),
    DateTime(2025, 08, 23),
    DateTime(2025, 08, 22),
    DateTime(2025, 08, 25),
    DateTime(2025, 08, 26),
    DateTime(2025, 08, 27),
    DateTime(2025, 08, 28),
    DateTime(2025, 08, 29),
  ];

  final List<DateTime> _absentDates = [
    DateTime(2025, 06, 7),
    DateTime(2025, 06, 12),
    DateTime(2025, 06, 14),
    DateTime(2025, 06, 18),
    DateTime(2025, 06, 24),
    DateTime(2025, 06, 30),

    DateTime(2025, 07, 15),
    DateTime(2025, 07, 16),
    DateTime(2025, 07, 14),
    DateTime(2025, 07, 18),
    DateTime(2025, 07, 21),
    DateTime(2025, 07, 24),
    DateTime(2025, 07, 25),
    DateTime(2025, 07, 30),
    DateTime(2025, 07, 31),

    DateTime(2025, 08, 15),
    DateTime(2025, 08, 16),
    DateTime(2025, 08, 14),
    DateTime(2025, 08, 18),
    DateTime(2025, 08, 30),
  ];

  MonthlyAttendanceReport? _currentReport;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime _monthForReport = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );

  @override
  void initState() {
    super.initState();
    _monthForReport = DateTime(_focusedDay.year, _focusedDay.month, 1);
    _generateReportForMonth(_monthForReport);
  }

  void _generateReportForMonth(DateTime month) {
    int year = month.year;
    int monthValue = month.month;

    List<DateTime> normalizedPresentDates = _presentDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toList();
    List<DateTime> normalizedAbsentDates = _absentDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toList();

    List<DateTime> presentInMonth = normalizedPresentDates
        .where((date) => date.year == year && date.month == monthValue)
        .toList();
    List<DateTime> absentInMonth = normalizedAbsentDates
        .where((date) => date.year == year && date.month == monthValue)
        .toList();

    int totalPresent = presentInMonth.length;
    int totalAbsent = absentInMonth.length;
    int daysInGivenMonth = DateTime(year, monthValue + 1, 0).day;
    double percentage = (daysInGivenMonth == 0)
        ? 0.0
        : (totalPresent / daysInGivenMonth) * 100;

    setState(() {
      _currentReport = MonthlyAttendanceReport(
        presentDays: totalPresent,
        absentDays: totalAbsent,
        presencePercentage: percentage,
        specificAbsentDatesInMonth: absentInMonth,
        reportedMonth: DateTime(year, monthValue, 1),
      );
    });
  }

  void _onPageChanged(DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      final newMonthForReport = DateTime(focusedDay.year, focusedDay.month, 1);
      if (_monthForReport != newMonthForReport) {
        _monthForReport = newMonthForReport;
        _generateReportForMonth(_monthForReport);
      }
    });
  }

  DayStatus _getDayStatus(DateTime day) {
    DateTime normalizedDay = DateTime(day.year, day.month, day.day);
    bool isPresent = _presentDates.any((d) => isSameDay(d, normalizedDay));
    bool isAbsent = _absentDates.any((d) => isSameDay(d, normalizedDay));

    if (isAbsent) return DayStatus.absent;
    if (isPresent) return DayStatus.present;
    return DayStatus.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        title: Text(
          "Attendance",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w600,
            color: green,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar<String>(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: _onPageChanged,
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        DayStatus status = _getDayStatus(day);
                        BoxDecoration? decoration;
                        TextStyle? textStyle;

                        if (status == DayStatus.present) {
                          decoration = BoxDecoration(
                            color: cardLightGreen.withOpacity(0.8),
                            shape: BoxShape.circle,
                          );
                          textStyle = TextStyle(color: Colors.black);
                        } else if (status == DayStatus.absent) {
                          decoration = BoxDecoration(
                            color: cardLightRed.withOpacity(0.8),
                            shape: BoxShape.circle,
                          );
                          textStyle = TextStyle(color: Colors.black54);
                        }

                        return Container(
                          margin: const EdgeInsets.all(5.0),

                          decoration: decoration,
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style:
                                  textStyle ??
                                  (isSameMonth(day, focusedDay)
                                      ? null
                                      : TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                        );
                      },
                      todayBuilder: (context, day, focusedDay) {
                        DayStatus status = _getDayStatus(day);
                        BoxDecoration decoration;
                        TextStyle textStyle;

                        if (status == DayStatus.present) {
                          decoration = BoxDecoration(
                            color: cardLightGreen,
                            shape: BoxShape.circle,
                            border: Border.all(color: green, width: 2),
                          );
                          textStyle = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          );
                        } else if (status == DayStatus.absent) {
                          decoration = BoxDecoration(
                            color: cardLightRed,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red.shade700,
                              width: 2,
                            ),
                          );
                          textStyle = TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          );
                        } else {
                          decoration = BoxDecoration(
                            color: green.withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: Border.all(color: green, width: 2),
                          );
                          textStyle = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          );
                        }

                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: decoration,
                          child: Center(
                            child: Text('${day.day}', style: textStyle),
                          ),
                        );
                      },
                      selectedBuilder: (context, day, focusedDay) {
                        DayStatus status = _getDayStatus(day);
                        BoxDecoration decoration;
                        TextStyle textStyle = TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        );
                        Color baseSelectedColor = Theme.of(
                          context,
                        ).primaryColorDark;

                        if (status == DayStatus.present) {
                          decoration = BoxDecoration(
                            color: cardLightGreen.withOpacity(0.95),

                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54,
                              width: 2.5,
                            ),
                          );
                          textStyle = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          );
                        } else if (status == DayStatus.absent) {
                          decoration = BoxDecoration(
                            color: cardLightRed.withOpacity(0.95),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54,
                              width: 2.5,
                            ),
                          );
                        } else {
                          decoration = BoxDecoration(
                            color: baseSelectedColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black45,
                              width: 2.5,
                            ),
                          );
                        }
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: decoration,
                          child: Center(
                            child: Text('${day.day}', style: textStyle),
                          ),
                        );
                      },
                      outsideBuilder: (context, day, focusedDay) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    calendarStyle: CalendarStyle(
                      markersMaxCount: 0,

                      todayDecoration: BoxDecoration(color: Colors.transparent),

                      selectedDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),

                      defaultDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),

                      outsideDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),

                      cellMargin: EdgeInsets.zero,
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_currentReport != null)
                    _buildReportWidget(_currentReport!)
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "No report data available for ${DateFormat.yMMMM().format(_monthForReport)}.",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportWidget(MonthlyAttendanceReport report) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Summary: ${DateFormat.yMMMM().format(report.reportedMonth)}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: green,
            ),
          ),
          const SizedBox(height: 12),
          _buildReportRow("Present Days:", "${report.presentDays}"),
          _buildReportRow("Absent Days:", "${report.absentDays}"),
          _buildReportRow(
            "Attendance Rate:",
            "${report.presencePercentage.toStringAsFixed(1)}% (of month days)",
          ),
          const SizedBox(height: 10),
          if (report.specificAbsentDatesInMonth.isNotEmpty) ...[
            Text(
              'Specific Absent Dates:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            ...report.specificAbsentDatesInMonth.map(
              (date) => Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                child: Text(
                  '• ${DateFormat.yMMMMd().format(date)}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ] else if (report.absentDays == 0 && report.presentDays > 0) ...[
            Text(
              'No absent dates recorded this month.',
              style: TextStyle(fontSize: 16),
            ),
          ] else if (report.absentDays == 0 && report.presentDays == 0) ...[
            Text(
              'No attendance data recorded for this month.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReportRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.black87)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
