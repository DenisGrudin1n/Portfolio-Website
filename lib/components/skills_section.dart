import 'dart:math';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> opacityAnimation;
  bool isTitleVisible = false;
  bool isSkillsContainer1Visible = false;
  bool isSkillsContainer2Visible = false;
  bool isSkillsContainer3Visible = false;
  bool isHovered = false;

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
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isSkillsContainer1Visible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isSkillsContainer2Visible = true;
      _animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isSkillsContainer3Visible = true;
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    const containerWidth = 335.0;
    const containerHeight = 525.0;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 100),
      color: bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          VisibilityDetector(
            key: const Key('skillsTitle'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                startAnimations();
              }
            },
            child: TranslationAnimatedWidget(
              duration: const Duration(milliseconds: 300),
              enabled: isTitleVisible,
              values: const [
                Offset(0, 0),
                Offset(0, 0),
              ],
              child: Opacity(
                opacity: isTitleVisible
                    ? pow(opacityAnimation.value, 5).toDouble()
                    : 0,
                child: const MouseRegion(
                  cursor: SystemMouseCursors.text,
                  child: Text(
                    "Skills",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: boldFontWeight,
                      color: kLight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Skills Container
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ScaleAnimatedWidget(
                duration: const Duration(milliseconds: 300),
                enabled: isSkillsContainer1Visible,
                values: const [0.0, 1.0],
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkBlack,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: Text(
                            "Technologies",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: boldFontWeight,
                              color: kLight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int i = 0; i < technologyItems.length; i += 2)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              if (i == technologyItems.length - 1)
                                Padding(
                                  padding: const EdgeInsets.only(left: 38),
                                  child: HoverableIcon(
                                    imgPath: technologyItems[i]["img"],
                                    title: technologyItems[i]["title"],
                                  ),
                                ),
                              if (i != technologyItems.length - 1)
                                Expanded(
                                  child: HoverableIcon(
                                    imgPath: technologyItems[i]["img"],
                                    title: technologyItems[i]["title"],
                                  ),
                                ),
                              if (i < technologyItems.length - 1)
                                Expanded(
                                  child: HoverableIcon(
                                    imgPath: technologyItems[i + 1]["img"],
                                    title: technologyItems[i + 1]["title"],
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ScaleAnimatedWidget(
                duration: const Duration(milliseconds: 300),
                enabled: isSkillsContainer2Visible,
                values: const [0.0, 1.0],
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkBlack,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: Text(
                            "Tools",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: boldFontWeight,
                              color: kLight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int i = 0; i < toolItems.length; i += 2)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              if (i == toolItems.length - 1)
                                Padding(
                                  padding: const EdgeInsets.only(left: 38),
                                  child: HoverableIcon(
                                    imgPath: toolItems[i]["img"],
                                    title: toolItems[i]["title"],
                                  ),
                                ),
                              if (i != toolItems.length - 1)
                                Expanded(
                                  child: HoverableIcon(
                                    imgPath: toolItems[i]["img"],
                                    title: toolItems[i]["title"],
                                  ),
                                ),
                              if (i < toolItems.length - 1)
                                Expanded(
                                  child: HoverableIcon(
                                    imgPath: toolItems[i + 1]["img"],
                                    title: toolItems[i + 1]["title"],
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ScaleAnimatedWidget(
                duration: const Duration(milliseconds: 300),
                enabled: isSkillsContainer3Visible,
                values: const [0.0, 1.0],
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: darkBlack,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.text,
                          child: Text(
                            "Platforms",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: boldFontWeight,
                              color: kLight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int i = 0; i < platformItems.length; i += 2)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              if (i == platformItems.length - 1)
                                Padding(
                                  padding: const EdgeInsets.only(left: 38),
                                  child: HoverableIcon(
                                    imgPath: platformItems[i]["img"],
                                    title: platformItems[i]["title"],
                                  ),
                                ),
                              if (i != platformItems.length - 1)
                                Expanded(
                                  child: HoverableIcon(
                                    imgPath: platformItems[i]["img"],
                                    title: platformItems[i]["title"],
                                  ),
                                ),
                              if (i < platformItems.length - 1)
                                Expanded(
                                  child: HoverableIcon(
                                    imgPath: platformItems[i + 1]["img"],
                                    title: platformItems[i + 1]["title"],
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
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

class HoverableIcon extends StatefulWidget {
  final String imgPath;
  final String title;

  const HoverableIcon({
    Key? key,
    required this.imgPath,
    required this.title,
  }) : super(key: key);

  @override
  HoverableIconState createState() => HoverableIconState();
}

class HoverableIconState extends State<HoverableIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 30),
        child: Column(
          children: [
            widget.imgPath.endsWith('.svg')
                ? SvgPicture.asset(
                    widget.imgPath,
                    height: skillsIconSize,
                    width: skillsIconSize,
                  )
                : Image.asset(
                    widget.imgPath,
                    height: skillsIconSize,
                    width: skillsIconSize,
                  ),
            const SizedBox(
              height: heightBetweenSkillIconAndTitle,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: skillsTitleTextSize,
                fontWeight: lightFontWeight,
                color: kLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
