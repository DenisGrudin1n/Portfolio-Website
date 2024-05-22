import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 100),
      color: bgLight1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // title
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 30,
              fontWeight: boldFontWeight,
              color: kLight,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/aboutIcons/about.jpg",
            height: 280,
            width: 420,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  """Recent university graduate with background in algorithms, data structures and object-oriented programming. Additionally, specialized courses in mobile development with a focus on Flutter & Figma.""",
                  style: TextStyle(
                    color: kLightSecondary,
                    fontWeight: mediumFontWeight,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  """Excellent focus, communication, and ability to learn rapidly. Excels working in a team environment. Strong critical analysis and problem solving.""",
                  style: TextStyle(
                    color: kLightSecondary,
                    fontWeight: mediumFontWeight,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
