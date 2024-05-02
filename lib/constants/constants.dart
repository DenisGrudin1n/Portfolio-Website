import 'package:flutter/material.dart';

const Color kLight = Colors.white;
const Color bgLight1 = Color(0xff333646);
const Color bgDark1 = Color.fromARGB(255, 47, 45, 57);
const Color yellowSecondary = Color(0xffFFC26C);

const FontWeight mediumFontWeight = FontWeight.w500;
const FontWeight boldFontWeight = FontWeight.bold;

BoxDecoration kHeaderDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: [Colors.transparent, bgLight1],
  ),
  borderRadius: BorderRadius.circular(100),
);

List<String> navTitles = [
  "Home",
  "Skills",
  "Projects",
  "Blog",
  "Contact",
];