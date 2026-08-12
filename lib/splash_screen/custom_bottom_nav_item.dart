import 'package:flutter/material.dart';

class CustomBottomNavItem {
  final String label;
  final String imagePath;

  CustomBottomNavItem({required this.label, required this.imagePath});

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      label: label,
      icon: ImageIcon(AssetImage(imagePath)),
    );
  }
}