import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double textWidth =
            constraints.maxWidth >= kBetweenAboutWidth ? 500 : 400;
        double sizedBoxWidth =
            constraints.maxWidth >= kBetweenAboutWidth ? 100 : 50;

        return Container(
          width: constraints.maxWidth,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/aboutIcons/about.jpg",
                    height: 300,
                    width: 450,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: sizedBoxWidth,
                  ),
                  SizedBox(
                    width: textWidth,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          """Recent university graduate with background in algorithms, data structures and object-oriented programming. Additionally, specialized courses in mobile development with a focus on Flutter & Figma.""",
                          style: TextStyle(
                            color: kLightSecondary,
                            fontWeight: mediumFontWeight,
                            fontSize: 22,
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
                            fontSize: 22,
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
      },
    );
  }
}
