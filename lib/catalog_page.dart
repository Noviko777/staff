import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [],
        activeIndex: 1,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) {},
      ),
    );
  }
}
