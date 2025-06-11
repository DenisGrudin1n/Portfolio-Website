import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/models/project_model.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:js' as js;

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool isProjectCommercial;

  const ProjectCard({
    super.key,
    required this.project,
    required this.isProjectCommercial,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return !widget.isProjectCommercial
        ? InkWell(
            onTap: () {
              if (widget.project.githubLink != null) {
                js.context.callMethod(
                  'open',
                  [widget.project.githubLink],
                );
              }
            },
            child: ProjectContainer(
              project: widget.project,
              isProjectCommercial: widget.isProjectCommercial,
            ),
          )
        : ProjectContainer(
            project: widget.project,
            isProjectCommercial: widget.isProjectCommercial,
          );
  }
}

class ProjectContainer extends StatefulWidget {
  const ProjectContainer({
    super.key,
    required this.project,
    required this.isProjectCommercial,
  });
  final ProjectModel project;
  final bool isProjectCommercial;

  @override
  State<ProjectContainer> createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer> {
  List<bool> isHovered = [false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 400,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.0, color: Colors.black.withValues(alpha: 0.45)),
        color: bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // image
          Image.asset(
            widget.project.image,
            width: 260,
            height: 200,
            fit: BoxFit.cover,
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              12,
              12,
              10,
            ),
            child: Text(
              widget.project.title,
              style: const TextStyle(fontWeight: mediumFontWeight, color: kLight),
            ),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              0,
              12,
              10,
            ),
            child: Text(
              widget.project.subtitle,
              style: const TextStyle(
                fontSize: 9.5,
                fontWeight: mediumFontWeight,
                color: kLightSecondary,
              ),
            ),
          ),
          const Spacer(),
          // footer
          Container(
            color: bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  'Available on:',
                  style: TextStyle(
                    color: greenSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                for (var entry in widget.project.icons.asMap().entries) ...[
                  const SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: !widget.isProjectCommercial
                        ? null
                        : () {
                            js.context.callMethod(
                              'open',
                              [widget.project.iconsLinks![entry.key]],
                            );
                          },
                    child: entry.value.endsWith('.svg')
                        ? !widget.isProjectCommercial
                            ? SvgPicture.asset(
                                entry.value,
                                height: 17,
                                width: 17,
                              )
                            : MouseRegion(
                                onEnter: (_) => setState(() => isHovered[entry.key] = true),
                                onExit: (_) => setState(() => isHovered[entry.key] = false),
                                child: AnimatedOpacity(
                                  opacity: isHovered[entry.key] ? 0.75 : 1.0,
                                  duration: const Duration(milliseconds: 30),
                                  child: SvgPicture.asset(
                                    entry.value,
                                    height: entry.value.endsWith('app-store.svg') ? 20 : 17,
                                    width: entry.value.endsWith('app-store.svg') ? 20 : 17,
                                  ),
                                ),
                              )
                        : Image.asset(
                            entry.value,
                            height: 17,
                            width: 17,
                          ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
