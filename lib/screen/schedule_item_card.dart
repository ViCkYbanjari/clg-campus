import 'package:flutter/material.dart';
import '../features/colors.dart';

const Color darkSlateGray = Color(0xFF4A5568);
const Color lightGray = Colors.grey;


class ScheduleItem {
  final String startTime;
  final String endTime;
  final String title;
  final String room;
  final String professor;
  final Color cardColor;
  final Color titleColor;

  ScheduleItem({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.room,
    required this.professor,
    required this.cardColor,
    required this.titleColor,
  });
}


class ScheduleItemCard extends StatelessWidget {
  final ScheduleItem item;
  const ScheduleItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(item.startTime,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: darkSlateGray)),
                Container(
                  height: 60,
                  width: 3,
                  color: Colors.grey[300],
                ),
                // const SizedBox(height: 60),
                Text(item.endTime, style: const TextStyle(color: darkSlateGray,
                  fontWeight: FontWeight.w500,)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 130, 
            child: VerticalDivider(
              color: Colors.grey[300],
              thickness: 4,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: item.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(item.title,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: item.titleColor)),
                      ),
                      const Icon(Icons.more_horiz, color: Colors.black54),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.person_outline,
                          color: Colors.black54, size: 16),
                      const SizedBox(width: 4),
                      Text(item.professor,
                          style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          color: Colors.black54, size: 16),
                      const SizedBox(width: 4),
                      Text(item.room,
                          style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
