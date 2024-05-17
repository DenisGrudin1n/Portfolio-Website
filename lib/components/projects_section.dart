import 'package:flutter/material.dart';
import 'package:portfolioapp/components/project_card.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/models/project_model.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (int i = 0; i < projects.length; i++)
                ProjectCard(
                  project: projects[i],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
