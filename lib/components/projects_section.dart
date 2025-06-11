import 'package:flutter/material.dart';
import 'package:portfolioapp/components/project_card.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:portfolioapp/models/project_model.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:visibility_detector/visibility_detector.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => ProjectsSectionState();
}

class ProjectsSectionState extends State<ProjectsSection> with SingleTickerProviderStateMixin {
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
    delayValues = List.generate(projects.length, (index) => index * 0.2);
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
      await Future.delayed(Duration(milliseconds: (delayValues[i] * 1000).toInt()));
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
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: pow(opacityAnimation.value, 5).toDouble(),
              child: const MouseRegion(
                cursor: SystemMouseCursors.text,
                child: GradientText(
                  'Projects',
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
          // Projects cards
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (int i = 0; i < 2; i++)
                VisibilityDetector(
                  key: Key(
                    'projectsCard${i.toString()}',
                  ),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.9) {
                      startAnimations();
                      context.read<NavTitlesProvider>().setActiveIndex(3);
                    }
                  },
                  child: ScaleAnimatedWidget(
                    duration: const Duration(milliseconds: 300),
                    enabled: isProjectCardVisibleList[i],
                    values: const [0.0, 1.0],
                    child: Transform.scale(
                      scale: 1.2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35, 35, 35, 55),
                        child: HoverableProjectCard(
                          project: projects[i],
                          isProjectCommercial: projects[i].iconsLinks != null,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (int i = 2; i < projects.length; i++)
                VisibilityDetector(
                  key: Key(
                    'projectsCard${i.toString()}',
                  ),
                  onVisibilityChanged: (info) {
                    if (info.visibleFraction > 0.9) {
                      startAnimations();
                      context.read<NavTitlesProvider>().setActiveIndex(3);
                    }
                  },
                  child: ScaleAnimatedWidget(
                    duration: const Duration(milliseconds: 300),
                    enabled: isProjectCardVisibleList[i],
                    values: const [0.0, 1.0],
                    child: Transform.scale(
                      scale: 1.2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35, 35, 35, 55),
                        child: HoverableProjectCard(
                          project: projects[i],
                          isProjectCommercial: projects[i].iconsLinks != null,
                        ),
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
  final bool isProjectCommercial;

  const HoverableProjectCard({
    super.key,
    required this.project,
    required this.isProjectCommercial,
  });

  @override
  HoverableProjectCardState createState() => HoverableProjectCardState();
}

class HoverableProjectCardState extends State<HoverableProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedOpacity(
        opacity: isHovered && !widget.isProjectCommercial ? 0.75 : 1.0,
        duration: const Duration(milliseconds: 30),
        child: ProjectCard(
          project: widget.project,
          isProjectCommercial: widget.isProjectCommercial,
        ),
      ),
    );
  }
}
