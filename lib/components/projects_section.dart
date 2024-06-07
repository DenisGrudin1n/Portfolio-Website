import 'package:flutter/material.dart';
import 'package:portfolioapp/components/project_card.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/models/project_model.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'dart:math';

import 'package:visibility_detector/visibility_detector.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => ProjectsSectionState();
}

class ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  bool isTitleVisible = false;
  bool isProjectCardVisible = false;
  List<bool> isProjectCardVisibleList = [];
  late List<double> delayValues;

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
    delayValues = List.generate(projects.length, (index) => index * 0.3);
    for (int i = 0; i < projects.length; i++) {
      isProjectCardVisibleList.add(false);
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
      isTitleVisible = true;
      animationController.forward();
    });
    await Future.delayed(const Duration(milliseconds: 300));
    for (int i = 0; i < projects.length; i++) {
      await Future.delayed(
          Duration(milliseconds: (delayValues[i] * 1000).toInt()));
      setState(() {
        isProjectCardVisibleList[i] = true;
        animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 45),
      child: Column(
        children: [
          // Projects title
          VisibilityDetector(
            key: const Key('projectsTitle'),
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
                opacity: pow(opacityAnimation.value, 5).toDouble(),
                child: const MouseRegion(
                  cursor: SystemMouseCursors.text,
                  child: Text(
                    "Projects",
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
          // Projects cards
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (int i = 0; i < projects.length; i++)
                ScaleAnimatedWidget(
                  duration: const Duration(milliseconds: 300),
                  enabled: isProjectCardVisibleList[i],
                  values: const [0.0, 1.0],
                  child: Transform.scale(
                    scale: 1.2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(35, 35, 35, 55),
                      child: HoverableProjectCard(
                        project: projects[i],
                      ),
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

class HoverableProjectCard extends StatefulWidget {
  final ProjectModel project;

  const HoverableProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  HoverableProjectCardState createState() => HoverableProjectCardState();
}

class HoverableProjectCardState extends State<HoverableProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedOpacity(
        opacity: _isHovered ? 0.85 : 1.0,
        duration: const Duration(milliseconds: 30),
        child: ProjectCard(project: widget.project),
      ),
    );
  }
}
