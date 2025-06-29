import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:portfolioapp/services/download_service.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainMobile extends StatefulWidget {
  final VoidCallback? onContactButtonTap;

  const MainMobile({super.key, required this.onContactButtonTap});

  @override
  MainMobileState createState() => MainMobileState();
}

class MainMobileState extends State<MainMobile> with SingleTickerProviderStateMixin {
  bool isAvatarVisible = false;
  bool isTitleVisible = false;
  bool isSubtitleVisible = false;
  bool isTextVisible = false;
  bool isButton1Visible = false;
  bool isButton2Visible = false;

  late AnimationController animationController;
  late Animation<double> opacityAnimation;

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
      isSubtitleVisible = true;
      animationController.forward();
      isAvatarVisible = true;
      animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      isTextVisible = true;
      animationController.forward();
    });

    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      isButton1Visible = true;
      animationController.forward();
    });

    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      isButton2Visible = true;
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return SingleChildScrollView(
      child: Container(
        color: bgLight1,
        height: screenWidth < 480 ? screenHeight + 100 : screenHeight,
        constraints: BoxConstraints(
          minHeight: minConstraintHeight(screenWidth),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VisibilityDetector(
              key: const Key('MainMobileAvatar'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  startAnimations();
                  context.read<NavTitlesProvider>().setActiveIndex(0);
                }
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isAvatarVisible ? pow(opacityAnimation.value, 0.1).toDouble() : 0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: screenWidth / 6,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/avatars/me.jpg',
                      fit: BoxFit.cover,
                      width: screenWidth / 3,
                      height: screenWidth / 3,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return const SizedBox.shrink(); // Return an empty container if there's an error
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            VisibilityDetector(
              key: const Key('MainMobileTitle'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  startAnimations();
                  context.read<NavTitlesProvider>().setActiveIndex(0);
                }
              },
              child: TranslationAnimatedWidget(
                enabled: isTitleVisible,
                duration: const Duration(milliseconds: 200),
                values: const [
                  Offset(0, 50), // Offsets for animation start
                  Offset(0, 0) // Offsets for animation end
                ],
                child: Opacity(
                  opacity: isTitleVisible ? opacityAnimation.value : 0,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.text,
                    child: Text(
                      'Flutter Mobile',
                      style: TextStyle(
                        color: kLight,
                        fontWeight: boldFontWeight,
                        fontSize: 50,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            VisibilityDetector(
              key: const Key('MainMobileSubtitle'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  startAnimations();
                  context.read<NavTitlesProvider>().setActiveIndex(0);
                }
              },
              child: TranslationAnimatedWidget(
                enabled: isSubtitleVisible,
                duration: const Duration(milliseconds: 200),
                values: const [
                  Offset(0, 50), // Offsets for animation start
                  Offset(0, 0) // Offsets for animation end
                ],
                child: Opacity(
                  opacity: isSubtitleVisible ? opacityAnimation.value : 0,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.text,
                    child: Text(
                      'Developer',
                      style: TextStyle(
                        color: kLight,
                        fontWeight: boldFontWeight,
                        fontSize: 50,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            VisibilityDetector(
              key: const Key('MainMobileText'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  startAnimations();
                  context.read<NavTitlesProvider>().setActiveIndex(0);
                }
              },
              child: TranslationAnimatedWidget(
                enabled: isTextVisible,
                duration: const Duration(milliseconds: 200),
                values: const [
                  Offset(0, 50), // Offsets for animation start
                  Offset(0, 0) // Offsets for animation end
                ],
                child: Opacity(
                  opacity: isTextVisible ? opacityAnimation.value : 0,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.text,
                    child: Text(
                      'Hi, I`m Denis. A passionate mobile developer',
                      style: TextStyle(
                        color: kLight,
                        fontWeight: mediumFontWeight,
                        fontSize: 22,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            VisibilityDetector(
              key: const Key('MainMobileText2'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  startAnimations();
                  context.read<NavTitlesProvider>().setActiveIndex(0);
                }
              },
              child: TranslationAnimatedWidget(
                enabled: isTextVisible,
                duration: const Duration(milliseconds: 200),
                values: const [
                  Offset(0, 50), // Offsets for animation start
                  Offset(0, 0) // Offsets for animation end
                ],
                child: Opacity(
                  opacity: isTextVisible ? opacityAnimation.value : 0,
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.text,
                    child: Text(
                      'from Uzhhgorod, Ukraine.',
                      style: TextStyle(
                        color: kLight,
                        fontWeight: mediumFontWeight,
                        fontSize: 22,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            VisibilityDetector(
              key: const Key('MainMobileButtons'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  startAnimations();
                  context.read<NavTitlesProvider>().setActiveIndex(0);
                }
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 480) {
                    return Column(
                      children: [
                        TranslationAnimatedWidget(
                          enabled: isButton1Visible,
                          duration: const Duration(milliseconds: 200),
                          values: const [
                            Offset(-30, 0), // Offsets for animation start
                            Offset(0, 0) // Offsets for animation end
                          ],
                          child: Opacity(
                            opacity: isButton1Visible ? opacityAnimation.value : 0,
                            child: SizedBox(
                              width: 220,
                              height: 60,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: greenSecondary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  launchUrl(
                                      'https://drive.google.com/file/d/1NKHLut2M9HOLOSKER2-eZP6_rOZv3wfT/view?usp=sharing');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientText(
                                      'Download CV',
                                      style: TextStyle(
                                        color: greenSecondary,
                                        fontWeight: boldFontWeight,
                                        fontSize: 20,
                                      ),
                                      gradient: kGreenGradient,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.file_download_outlined,
                                      color: greenSecondary,
                                      size: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TranslationAnimatedWidget(
                          enabled: isButton2Visible,
                          duration: const Duration(milliseconds: 200),
                          values: const [
                            Offset(30, 0), // Offsets for animation start
                            Offset(0, 0) // Offsets for animation end
                          ],
                          child: Opacity(
                            opacity: isButton2Visible ? opacityAnimation.value : 0,
                            child: Container(
                              width: 220,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: kGreenGradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  disabledBackgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: widget.onContactButtonTap,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Get in touch',
                                      style: TextStyle(
                                        color: kLight,
                                        fontWeight: boldFontWeight,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      Icons.chat_outlined,
                                      color: kLight,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TranslationAnimatedWidget(
                          enabled: isButton1Visible,
                          duration: const Duration(milliseconds: 200),
                          values: const [
                            Offset(-30, 0), // Offsets for animation start
                            Offset(0, 0) // Offsets for animation end
                          ],
                          child: Opacity(
                            opacity: isButton1Visible ? opacityAnimation.value : 0,
                            child: SizedBox(
                              width: 220,
                              height: 60,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: greenSecondary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  launchUrl(
                                      'https://drive.google.com/file/d/1DTmKNntFXnCUQAYA9xH-DDg1hSnStldv/view?usp=sharing');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientText(
                                      'Download CV',
                                      style: TextStyle(
                                        color: greenSecondary,
                                        fontWeight: boldFontWeight,
                                        fontSize: 20,
                                      ),
                                      gradient: kGreenGradient,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.file_download_outlined,
                                      color: greenSecondary,
                                      size: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TranslationAnimatedWidget(
                          enabled: isButton2Visible,
                          duration: const Duration(milliseconds: 300),
                          values: const [
                            Offset(30, 0), // Offsets for animation start
                            Offset(0, 0) // Offsets for animation end
                          ],
                          child: Opacity(
                            opacity: isButton2Visible ? opacityAnimation.value : 0,
                            child: Container(
                              width: 220,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: kGreenGradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  disabledBackgroundColor: Colors.transparent,
                                  disabledForegroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: widget.onContactButtonTap,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Get in touch',
                                      style: TextStyle(
                                        color: kLight,
                                        fontWeight: boldFontWeight,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      Icons.chat_outlined,
                                      color: kLight,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double minConstraintHeight(double screenWidth) {
    if (screenWidth < 500) {
      return 780;
    } else if (screenWidth < kMinDesktopWidth) {
      return 700;
    }
    return 670;
  }
}
