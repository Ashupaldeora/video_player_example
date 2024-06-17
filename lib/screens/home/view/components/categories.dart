import 'package:flutter/material.dart';

class SegmentedButtons extends StatefulWidget {
  @override
  _SegmentedButtonsState createState() => _SegmentedButtonsState();
}

class _SegmentedButtonsState extends State<SegmentedButtons> {
  final List<String> categories = [
    'Trending',
    'Videos',
    'Songs',
    'Movies',
    'Seasons'
  ];

  String selectedCategory = 'Trending';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected = category == selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFFFA726) : Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
