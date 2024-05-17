import 'package:flutter/material.dart';
import 'package:portfolioapp/components/project_card.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/models/project_model.dart';

class ProjectsDesktop extends StatelessWidget {
  const ProjectsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 50),
      child: Column(
        children: [
          // projects title
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 30,
              fontWeight: boldFontWeight,
              color: kLight,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // projects cards
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProjectCard(
                project: projects[0],
              ),
              const SizedBox(
                width: 20,
              ),
              ProjectCard(
                project: projects[1],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
