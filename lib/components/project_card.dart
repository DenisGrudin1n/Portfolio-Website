import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/models/project_model.dart';
import 'dart:js' as js;

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (project.githubLink != null) {
          js.context.callMethod(
            "open",
            [project.githubLink],
          );
        }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 350,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.0, color: Colors.black.withOpacity(0.45)),
          color: bgLight2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            Image.asset(
              project.image,
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
                project.title,
                style: const TextStyle(
                    fontWeight: mediumFontWeight, color: kLight),
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
                project.subtitle,
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
                    "Available on:",
                    style: TextStyle(
                      color: greenSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const Spacer(),
                  for (String icon in project.icons) ...[
                    const SizedBox(
                      width: 3,
                    ),
                    if (icon.endsWith('.svg'))
                      SvgPicture.asset(
                        icon,
                        height: 17,
                        width: 17,
                      )
                    else
                      Image.asset(
                        icon,
                        height: 17,
                        width: 17,
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
