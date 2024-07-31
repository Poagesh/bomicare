import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigation_Bar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  Navigation_Bar({required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: GNav(
          gap: 8,
          activeColor: Colors.green,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.green.withOpacity(0.1),
          color: const Color.fromARGB(255, 0, 50, 2),
          tabs: [
            GButton(
              icon: Icons.home,
            ),
            GButton(
              icon: Icons.cloud,
            ),
            GButton(
              icon: Icons.grain,
            ),
            GButton(
              icon: Icons.water,
            ),
            GButton(
              icon: Icons.notifications,
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
        ),
      ),
    );
  }
}
