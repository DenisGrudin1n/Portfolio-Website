import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutDesktop extends StatefulWidget {
  const AboutDesktop({super.key});

  @override
  AboutDesktopState createState() => AboutDesktopState();
}

class AboutDesktopState extends State<AboutDesktop> with SingleTickerProviderStateMixin {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double textWidth = constraints.maxWidth >= kBetweenAboutWidth ? 500 : 400;
        final double sizedBoxWidth = constraints.maxWidth >= kBetweenAboutWidth ? 100 : 50;

        return Container(
          width: constraints.maxWidth,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              VisibilityDetector(
                key: const Key('titleAboutDesktop'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.5) {
                    startAnimations();
                  }
                },
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
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
              // Image and Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VisibilityDetector(
                    key: const Key('imageAboutDesktop'),
                    onVisibilityChanged: (info) {
                      if (!isImageVisible && info.visibleFraction > 0.5) {
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
                        height: 300,
                        width: 450,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sizedBoxWidth,
                  ),
                  SizedBox(
                    width: textWidth,
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
                                '''My name is Denis Grudinin, I am a software developer from Ukraine who is passionate about Flutter development. I have 1.5 years of commercial experience, including a couple of published apps on Google Play and App Store.''',
                                style: TextStyle(
                                  color: kLightSecondary,
                                  fontWeight: mediumFontWeight,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Second Text
                        VisibilityDetector(
                          key: const Key('AboutText2'),
                          onVisibilityChanged: (info) {
                            if (info.visibleFraction > 0.5) {
                              startAnimations();
                              context.read<NavTitlesProvider>().setActiveIndex(1);
                            }
                          },
                          child: TranslationAnimatedWidget(
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
                                  '''Strong foundation in algorithms, data structures, and clean architecture, with hands-on expertise in Firebase, REST APIs, and state management using BLoC. Detail-oriented, quick to learn, and experienced in collaborating closely with designers and team leads to deliver pixel-perfect, production-ready apps.''',
                                  style: TextStyle(
                                    color: kLightSecondary,
                                    fontWeight: mediumFontWeight,
                                    fontSize: 22,
                                  ),
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
            ],
          ),
        );
      },
    );
  }
}
