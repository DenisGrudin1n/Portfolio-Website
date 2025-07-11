import 'dart:math';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:portfolioapp/services/download_service.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContactsSection extends StatefulWidget {
  const ContactsSection({super.key});

  @override
  State<ContactsSection> createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> opacityAnimation;
  bool isTitleVisible = false;
  bool isContactItem1Visible = false;
  bool isContactItem2Visible = false;
  bool isContactItem3Visible = false;
  bool isContactItem4Visible = false;
  bool isContactItem5Visible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startAnimations() async {
    setState(() {
      isTitleVisible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isContactItem1Visible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() {
      isContactItem2Visible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() {
      isContactItem3Visible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() {
      isContactItem4Visible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() {
      isContactItem5Visible = true;
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 75),
      color: bgLight1,
      child: Column(
        children: [
          VisibilityDetector(
            key: const Key('contactsTitle'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: isTitleVisible ? pow(opacityAnimation.value, 5).toDouble() : 0,
              child: const MouseRegion(
                cursor: SystemMouseCursors.text,
                child: GradientText(
                  'Contacts',
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
            height: 25,
          ),
          Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScaleAnimatedWidget(
                      duration: const Duration(milliseconds: 200),
                      enabled: isContactItem1Visible,
                      values: const [0.0, 1.0],
                      child: contactItem(contactItems[0], launchUrl)),
                  ScaleAnimatedWidget(
                      duration: const Duration(milliseconds: 200),
                      enabled: isContactItem2Visible,
                      values: const [0.0, 1.0],
                      child: contactItem(contactItems[1], launchUrl)),
                  ScaleAnimatedWidget(
                      duration: const Duration(milliseconds: 200),
                      enabled: isContactItem3Visible,
                      values: const [0.0, 1.0],
                      child: contactItem(contactItems[2], launchUrl)),
                ],
              ),
              const SizedBox(width: 350),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScaleAnimatedWidget(
                      duration: const Duration(milliseconds: 200),
                      enabled: isContactItem4Visible,
                      values: const [0.0, 1.0],
                      child: contactItem(contactItems[3], launchUrl)),
                  VisibilityDetector(
                    key: const Key('contactsItem'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.9) {
                        startAnimations();
                        context.read<NavTitlesProvider>().setActiveIndex(4);
                      }
                    },
                    child: ScaleAnimatedWidget(
                        duration: const Duration(milliseconds: 200),
                        enabled: isContactItem5Visible,
                        values: const [0.0, 1.0],
                        child: contactItem(contactItems[4], launchUrl)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contactItem(Map<String, String> item, Function(String) launchUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: item['link'] != null ? () => launchUrl(item['link']!) : null,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: kLight,
              child: Image.asset(
                item['icon']!,
                height: 32.5,
                width: 32.5,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.text,
                child: Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: boldFontWeight,
                    color: kLight,
                  ),
                ),
              ),
              InkWell(
                onTap: item['link'] != null ? () => launchUrl(item['link']!) : null,
                child: Text(
                  item['subtitle']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: mediumFontWeight,
                    color: kLightSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
