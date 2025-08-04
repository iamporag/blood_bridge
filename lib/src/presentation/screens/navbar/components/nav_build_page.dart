import 'package:blood_bridge/src/presentation/screens/home/drawer/drawer_page.dart';
import 'package:blood_bridge/src/presentation/screens/home/fancy_home_screen.dart';
import 'package:blood_bridge/src/presentation/screens/profile_demo.dart';
import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> _widget = const [
   FancyHomeScreen(),
   ProfileScreen(),
  ];
  return _widget[index];
}