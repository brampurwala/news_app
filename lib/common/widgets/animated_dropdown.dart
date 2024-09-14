import 'package:flutter/material.dart';

class AnimatedDropdown extends StatefulWidget {
  const AnimatedDropdown({super.key});

  @override
  _AnimatedDropdownState createState() => _AnimatedDropdownState();
}

class _AnimatedDropdownState extends State<AnimatedDropdown> with SingleTickerProviderStateMixin {
  final List<String> categories = [
    'Pilgrimage',
    'Devotional',
    'Sports',
    'Technology',
    'Business',
    'Entertainment'
  ];
  String? selectedCategory;
  bool isDropdownOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      if (isDropdownOpen) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(selectedCategory ?? 'Select Category'),
                Icon(isDropdownOpen ? Icons.arrow_upward : Icons.arrow_downward),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: categories.map((String category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                      isDropdownOpen = false;
                      _controller.reverse();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Text(category),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}