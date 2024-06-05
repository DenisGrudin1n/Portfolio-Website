import 'dart:math';

import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/services/download_service.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainDesktop extends StatefulWidget {
  final VoidCallback? onContactButtonTap;

  const MainDesktop({super.key, required this.onContactButtonTap});

  @override
  State<MainDesktop> createState() => MainDesktopState();
}

class MainDesktopState extends State<MainDesktop>
    with SingleTickerProviderStateMixin {
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
      duration: const Duration(milliseconds: 1000),
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

    return Container(
      color: bgLight1,
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VisibilityDetector(
                key: const Key('titleMainDekstop'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.5) {
                    startAnimations();
                  }
                },
                child: TranslationAnimatedWidget(
                  enabled: isTitleVisible,
                  duration: const Duration(milliseconds: 300),
                  values: const [
                    Offset(-100, 0), // Offsets for animation start
                    Offset(0, 0) // Offsets for animation end
                  ],
                  child: Opacity(
                    opacity: isTitleVisible ? opacityAnimation.value : 0,
                    child: const Text(
                      "Flutter Mobile\nDeveloper",
                      style: TextStyle(
                        color: kLight,
                        fontWeight: boldFontWeight,
                        fontSize: 60,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              VisibilityDetector(
                key: const Key('textMainDekstop'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.5) {
                    startAnimations();
                  }
                },
                child: TranslationAnimatedWidget(
                  enabled: isTextVisible,
                  duration: const Duration(milliseconds: 300),
                  values: const [
                    Offset(-100, 0), // Offsets for animation start
                    Offset(0, 0) // Offsets for animation end
                  ],
                  child: Opacity(
                    opacity: isTextVisible ? opacityAnimation.value : 0,
                    child: const Text(
                      "Hi, I`m Denis. A passionate mobile developer\nfrom Uzhhgorod, Ukraine.\n",
                      style: TextStyle(
                        color: kLight,
                        fontWeight: mediumFontWeight,
                        fontSize: 20,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  VisibilityDetector(
                    key: const Key('button1MainDekstop'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.5) {
                        startAnimations();
                      }
                    },
                    child: TranslationAnimatedWidget(
                      enabled: isButton1Visible,
                      duration: const Duration(milliseconds: 300),
                      values: const [
                        Offset(0, 30), // Offsets for animation start
                        Offset(0, 0) // Offsets for animation end
                      ],
                      child: Opacity(
                        opacity: isButton1Visible ? opacityAnimation.value : 0,
                        child: SizedBox(
                          width: 250,
                          height: 60,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: yellowSecondary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              launchUrl(
                                  "https://drive.google.com/file/d/1DTmKNntFXnCUQAYA9xH-DDg1hSnStldv/view?usp=sharing");
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Download CV",
                                  style: TextStyle(
                                    color: yellowSecondary,
                                    fontWeight: boldFontWeight,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.file_download_outlined,
                                  color: yellowSecondary,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  VisibilityDetector(
                    key: const Key('button2MainDekstop'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.5) {
                        startAnimations();
                      }
                    },
                    child: TranslationAnimatedWidget(
                      enabled: isButton2Visible,
                      duration: const Duration(milliseconds: 300),
                      values: const [
                        Offset(0, 30), // Offsets for animation start
                        Offset(0, 0) // Offsets for animation end
                      ],
                      child: Opacity(
                        opacity: isButton2Visible ? opacityAnimation.value : 0,
                        child: SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: yellowSecondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: widget.onContactButtonTap,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get in touch",
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
                  ),
                ],
              ),
            ],
          ),
          VisibilityDetector(
            key: const Key('avatarMainDekstop'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: TranslationAnimatedWidget(
              enabled: isAvatarVisible,
              duration: const Duration(milliseconds: 300),
              values: const [
                Offset(0, 0), // Offsets for animation start
                Offset(0, 0) // Offsets for animation end
              ],
              child: Opacity(
                opacity: isAvatarVisible
                    ? pow(opacityAnimation.value, 0.15).toDouble()
                    : 0,
                child: CircleAvatar(
                  radius: screenWidth / 7.5,
                  child: ClipOval(
                    child: Image.network(
                      "assets/avatars/me.png",
                      fit: BoxFit.cover,
                      width: screenWidth / 3.75,
                      height: screenWidth / 3.75,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const SizedBox
                              .shrink(); // Return an empty container while loading
                        }
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const SizedBox
                            .shrink(); // Return an empty container if there's an error
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
