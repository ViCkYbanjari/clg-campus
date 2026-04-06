import 'package:flutter/material.dart';

const Color darkSlateGray = Color(0xFF4A5568);
const Color lightGray = Colors.grey;

class CanteenItem {
  final String imageUrl;
  final String title;
  final String price; // Added price field
  final Color cardColor;
  final Color titleColor;

  CanteenItem({
    required this.imageUrl,
    required this.title,
    required this.price, // Required in constructor
    required this.cardColor,
    required this.titleColor,
  });
}

class CanteenItemCard extends StatelessWidget {
  final CanteenItem item;
  const CanteenItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Image Section (Big)
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.fastfood, size: 50, color: item.titleColor.withOpacity(0.5));
                  },
                ),
              ),
            ),
          ),
          // 2. Title & Price Section (Small)
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                children: [
                  // Title
                  Flexible(
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: item.titleColor,
                      ),
                    ),
                  ),
                  // Price
                  Text(
                    item.price, // Displaying the price
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: item.titleColor.withOpacity(0.8),
                    ),
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