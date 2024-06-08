import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolioapp/components/site_logo.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HeaderMobile extends StatefulWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  const HeaderMobile(
      {super.key, required this.onLogoTap, required this.onMenuTap});

  @override
  State<HeaderMobile> createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<HeaderMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  bool isLogoVisible = false;
  bool isDrawerIconVisible = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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
      isLogoVisible = true;
      animationController.forward();
      isDrawerIconVisible = true;
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          VisibilityDetector(
            key: const Key('headerMobileLogo'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: isLogoVisible
                  ? pow(opacityAnimation.value, 0.05).toDouble()
                  : 0,
              child: SiteLogo(
                onTap: widget.onLogoTap,
              ),
            ),
          ),
          const Spacer(),
          VisibilityDetector(
            key: const Key('headerMobileDrawerIcon'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: isDrawerIconVisible
                  ? pow(opacityAnimation.value, 0.05).toDouble()
                  : 0,
              child: IconButton(
                onPressed: widget.onMenuTap,
                icon: const Icon(
                  Icons.menu,
                  color: kLight,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
