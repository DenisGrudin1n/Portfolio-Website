import 'dart:math';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolioapp/components/site_logo.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HeaderDesktop extends StatefulWidget {
  final Function(int) onNavMenuTap;
  final VoidCallback? onLogoTap;

  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
    required this.onLogoTap,
  });

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  bool isLogoVisible = false;
  bool areNavTitlesVisible = false;
  List<bool> isNavTitlesVisibleList = [];

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
    for (int i = 0; i < navTitles.length; i++) {
      isNavTitlesVisibleList.add(false);
    }
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
      isLogoVisible = true;
      animationController.forward();
      areNavTitlesVisible = true;
      animationController.forward();
    });
    for (int i = 0; i < navTitles.length; i++) {
      setState(() {
        isNavTitlesVisibleList[i] = true;
        animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = context.watch<NavTitlesProvider>().activeIndex;

    return Container(
      height: 60,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 100, right: 100),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          VisibilityDetector(
            key: const Key('headerDesktopLogo'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isLogoVisible ? pow(opacityAnimation.value, 0.05).toDouble() : 0,
              child: TranslationAnimatedWidget(
                duration: const Duration(milliseconds: 300),
                enabled: isLogoVisible,
                values: const [
                  Offset(-200, 0),
                  Offset(0, 0),
                ],
                child: SiteLogo(
                  onTap: widget.onLogoTap,
                ),
              ),
            ),
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: areNavTitlesVisible ? pow(opacityAnimation.value, 0.01).toDouble() : 0,
              child: TranslationAnimatedWidget(
                duration: const Duration(milliseconds: 300),
                enabled: isNavTitlesVisibleList[i],
                values: const [
                  Offset(500, 0),
                  Offset(0, 0),
                ],
                child: TextButton(
                  onPressed: () {
                    widget.onNavMenuTap(i);
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return activeIndex == i
                          ? kGreenGradient.createShader(bounds)
                          : const LinearGradient(
                              colors: [kLight, kLight],
                            ).createShader(bounds);
                    },
                    child: Text(
                      navTitles[i],
                      style: const TextStyle(fontSize: 16, fontWeight: mediumFontWeight, color: kLight),
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
