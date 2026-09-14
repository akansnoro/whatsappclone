import 'package:flutter/material.dart';

class NavItem {
  String title;
  IconData icon;
  IconData selectedIcon;
  Widget page;


  NavItem({
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.page
  });


}