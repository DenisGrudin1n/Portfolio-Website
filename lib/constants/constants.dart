import 'package:flutter/material.dart';

const double kMinDesktopWidth = 800.0;

const Color kLight = Colors.white;
const Color bgLight1 = Color(0xff333646);
const Color bgDark1 = Color.fromARGB(255, 47, 45, 57);
const Color yellowSecondary = Color.fromARGB(255, 250, 183, 89);

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

List<IconData> navIcons = [
  Icons.home,
  Icons.handyman_outlined,
  Icons.apps,
  Icons.web,
  Icons.quick_contacts_mail,
];

List<Map> socialmediaItems = [
  {
    "img": "assets/linkedin.png",
    "title": "LinkedIn",
  },
  {
    "img": "assets/instagram.png",
    "title": "Instagram",
  },
  {
    "img": "assets/telegram.png",
    "title": "Telegram",
  }
];

List<Map> technologyItems = [
  {
    "img": "assets/dart-original.svg",
    "title": "Dart",
  },
  {
    "img": "assets/flutter-original.svg",
    "title": "Flutter",
  },
  {
    "img": "assets/firebase-original.svg",
    "title": "Firebase",
  },
  {
    "img": "assets/cplusplus-original.svg",
    "title": "C++",
  },
  {
    "img": "assets/csharp-original.svg",
    "title": "C#",
  },
  {
    "img": "assets/python-original.svg",
    "title": "Python",
  }
];

List<Map> toolItems = [
  {
    "img": "assets/git-original.svg",
    "title": "Git",
  },
  {
    "img": "assets/github-original.svg",
    "title": "GitHub",
  },
  {
    "img": "assets/vscode-original.svg",
    "title": "VsCode",
  },
  {
    "img": "assets/visualstudio-original.svg",
    "title": "Visual Studio",
  },
  {
    "img": "assets/androidstudio-original.svg",
    "title": "Android Studio",
  },
  {
    "img": "assets/googlecloud-original.svg",
    "title": "Google Cloud",
  },
  {
    "img": "assets/figma-original.svg",
    "title": "Figma",
  },
  {
    "img": "assets/photoshop-original.svg",
    "title": "Photoshop",
  },
  {
    "img": "assets/illustrator-original.svg",
    "title": "Illustrator",
  },
  {
    "img": "assets/aftereffects-original.svg",
    "title": "After Effects",
  },
  {
    "img": "assets/trello-original.svg",
    "title": "Trello",
  },
  {
    "img": "assets/unity-original.svg",
    "title": "Unity",
  }
];

List<Map> platformItems = [
  {
    "img": "assets/android-original.svg",
    "title": "Android",
  },
  {
    "img": "assets/ios-original.svg",
    "title": "IOS",
  },
  {
    "img": "assets/web_icon.png",
    "title": "Web",
  },
  {
    "img": "assets/desktop-icon.png",
    "title": "Desktop",
  }
];
