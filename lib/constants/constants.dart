import 'package:flutter/material.dart';

const double kMinDesktopWidth = 800.0;

const double skillsIconSize = 55.0;
const double heightBetweenSkillIconAndTitle = 3.0;
const double skillsTitleTextSize = 16.0;

const Color kLight = Colors.white;
const Color kLightSecondary = Color.fromARGB(255, 187, 187, 187);
const Color bgLight1 = Color(0xff333646);
const Color bgDark1 = Color.fromARGB(255, 47, 45, 57);
const Color yellowSecondary = Color.fromARGB(255, 250, 183, 89);
const Color bgLight2 = Colors.blueGrey;

const FontWeight lightFontWeight = FontWeight.w100;
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
    "img": "assets/skillsIcons/linkedin.png",
    "title": "LinkedIn",
  },
  {
    "img": "assets/skillsIcons/instagram.png",
    "title": "Instagram",
  },
  {
    "img": "assets/skillsIcons/telegram.png",
    "title": "Telegram",
  }
];

List<Map> technologyItems = [
  {
    "img": "assets/skillsIcons/dart-original.svg",
    "title": "Dart",
  },
  {
    "img": "assets/skillsIcons/cplusplus-original.svg",
    "title": "C++",
  },
  {
    "img": "assets/skillsIcons/flutter-original.svg",
    "title": "  Flutter",
  },
  {
    "img": "assets/skillsIcons/csharp-original.svg",
    "title": "C#",
  },
  {
    "img": "assets/skillsIcons/firebase-original.svg",
    "title": "Firebase",
  },
  {
    "img": "assets/skillsIcons/python-original.svg",
    "title": "Python",
  }
];

List<Map> toolItems = [
  {
    "img": "assets/skillsIcons/git-original.svg",
    "title": "Git",
  },
  {
    "img": "assets/skillsIcons/figma-original.svg",
    "title": "Figma",
  },
  {
    "img": "assets/skillsIcons/github-original.svg",
    "title": "GitHub",
  },
  {
    "img": "assets/skillsIcons/photoshop-original.svg",
    "title": "Photoshop",
  },
  {
    "img": "assets/skillsIcons/googlecloud-original.svg",
    "title": "Google Cloud",
  },
  {
    "img": "assets/skillsIcons/illustrator-original.svg",
    "title": "Illustrator",
  },
  {
    "img": "assets/skillsIcons/androidstudio-original.svg",
    "title": "Android Studio",
  },
  {
    "img": "assets/skillsIcons/trello-original.svg",
    "title": "Trello",
  },
];

List<Map> platformItems = [
  {
    "img": "assets/skillsIcons/android-original.svg",
    "title": "Android",
  },
  {
    "img": "assets/skillsIcons/ios-original.svg",
    "title": "IOS",
  },
  {
    "img": "assets/skillsIcons/web_icon.png",
    "title": "Web",
  },
  {
    "img": "assets/skillsIcons/desktop-icon.png",
    "title": "Desktop",
  }
];

List<Map<String, String>> contactItems = [
  {
    "icon": "assets/contactsIcons/email.png",
    "title": "Email",
    "subtitle": "denisgrudininworks@gmail.com",
    "link": "mailto:denisgrudininworks@gmail.com",
  },
  {
    "icon": "assets/contactsIcons/linkedin.png",
    "title": "LinkedIn",
    "subtitle": "linkedin.com/in/denis-grudinin/",
    "link": "https://linkedin.com/in/denis-grudinin/",
  },
  {
    "icon": "assets/contactsIcons/mobile.png",
    "title": "Mobile",
    "subtitle": "+380996276517",
    "link": "tel:+380996276517",
  },
  {
    "icon": "assets/contactsIcons/github.png",
    "title": "GitHub",
    "subtitle": "@DenisGrudin1n",
    "link": "https://github.com/DenisGrudin1n",
  },
  {
    "icon": "assets/contactsIcons/telegram.png",
    "title": "Telegram",
    "subtitle": "@Denis_Grudinin",
    "link": "https://t.me/Denis_Grudinin",
  }
];
