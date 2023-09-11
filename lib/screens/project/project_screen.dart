import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/project_model.dart';
import 'package:flutter_portfolio/utils/project_card.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: projectList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProjectCard(
              title: projectList[index].name,
              description: projectList[index].description,
              url: projectList[index].link,
              stars: projectList[index].stars!,
              tags: projectList[index].tags!,
            ),
          );
        },
      ),
    );
  }
}
