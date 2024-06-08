import 'package:flutter/material.dart';

const double kMinDesktopWidth = 950.0;
const double kBetweenAboutWidth = 1100.0;

const double skillsIconSize = 55.0;
const double heightBetweenSkillIconAndTitle = 3.0;
const double skillsTitleTextSize = 16.0;

const Color kLight = Colors.white;
const Color kLightSecondary = Color.fromARGB(255, 187, 187, 187);
const Color bgLight1 = Color.fromARGB(255, 17, 17, 25);
const Color bgDark1 = Color.fromARGB(255, 17, 17, 25);
const Color yellowSecondary = Color.fromARGB(255, 255, 175, 63);
const Color greenSecondary = Color.fromARGB(255, 0, 255, 180);
const Color bgLight2 = Colors.blueGrey;

const Color darkBlack = Color.fromARGB(255, 12, 12, 20);
const Color lightBlack = Color.fromARGB(255, 23, 23, 28);

const FontWeight lightFontWeight = FontWeight.w100;
const FontWeight mediumFontWeight = FontWeight.w500;
const FontWeight boldFontWeight = FontWeight.bold;

BoxDecoration kHeaderDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [bgDark1, bgLight1],
  ),
  //borderRadius: BorderRadius.circular(100),
);

const LinearGradient kOrangeGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 255, 175, 63),
    Color.fromARGB(255, 255, 175, 63),
    Color.fromARGB(255, 255, 201, 38),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const LinearGradient kGreenGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 0, 210, 135),
    Color.fromARGB(255, 0, 210, 135),
    Color.fromARGB(255, 0, 210, 180),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

List<String> navTitles = [
  "Home",
  "About",
  "Skills",
  "Projects",
  "Contacts",
];

List<IconData> navIcons = [
  Icons.home,
  Icons.person,
  Icons.handyman_outlined,
  Icons.apps,
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
