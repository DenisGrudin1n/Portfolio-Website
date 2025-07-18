import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  AboutMobileState createState() => AboutMobileState();
}

class AboutMobileState extends State<AboutMobile> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  bool isTitleVisible = false;
  bool isText1Visible = false;
  bool isText2Visible = false;
  bool isImageVisible = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void startAnimations() async {
    setState(() {
      isTitleVisible = true;
      animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isImageVisible = true;
      animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isText1Visible = true;
      animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isText2Visible = true;
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          VisibilityDetector(
            key: const Key('titleAboutMobile'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isTitleVisible ? pow(opacityAnimation.value, 5).toDouble() : 0,
              child: const MouseRegion(
                cursor: SystemMouseCursors.text,
                child: GradientText(
                  'About Me',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: boldFontWeight,
                    color: kLight,
                  ),
                  gradient: kGreenGradient,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Image
          VisibilityDetector(
            key: const Key('imageAboutMobile'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
                context.read<NavTitlesProvider>().setActiveIndex(1);
              }
            },
            child: ScaleAnimatedWidget(
              enabled: isImageVisible,
              duration: const Duration(milliseconds: 300),
              values: const [0.0, 1.0],
              child: Image.asset(
                'assets/aboutIcons/about.jpg',
                height: 280,
                width: 420,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Text
          SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First Text
                TranslationAnimatedWidget(
                  duration: const Duration(milliseconds: 200),
                  enabled: isText1Visible,
                  values: const [
                    Offset(0, 50),
                    Offset(0, 0),
                  ],
                  child: Opacity(
                    opacity: isText1Visible ? opacityAnimation.value : 0,
                    child: const MouseRegion(
                      cursor: SystemMouseCursors.text,
                      child: Text(
                        '''Recent university graduate with background in algorithms, data structures and object-oriented programming. Additionally, specialized courses in mobile development with a focus on Flutter & Figma.''',
                        style: TextStyle(
                          color: kLightSecondary,
                          fontWeight: mediumFontWeight,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Second Text
                TranslationAnimatedWidget(
                  duration: const Duration(milliseconds: 200),
                  enabled: isText2Visible,
                  values: const [
                    Offset(0, 50),
                    Offset(0, 0),
                  ],
                  child: Opacity(
                    opacity: isText2Visible ? opacityAnimation.value : 0,
                    child: const MouseRegion(
                      cursor: SystemMouseCursors.text,
                      child: Text(
                        '''Excellent focus, communication, and ability to learn rapidly. Excels working in a team environment. Strong critical analysis and problem solving.''',
                        style: TextStyle(
                          color: kLightSecondary,
                          fontWeight: mediumFontWeight,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
