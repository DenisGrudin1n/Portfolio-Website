import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(150, 50, 150, 100),
      color: bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Image.asset(
                "assets/aboutIcons/about.jpg",
                height: 350,
                width: 525,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 55,
              ),
              const SizedBox(
                width: 600,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      """Recent university graduate with background in algorithms, data structures and object-oriented programming. Additionally, specialized courses in mobile development with a focus on Flutter & Figma.""",
                      style: TextStyle(
                        color: kLightSecondary,
                        fontWeight: mediumFontWeight,
                        fontSize: 24,
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
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
