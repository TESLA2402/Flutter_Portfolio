import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/project_model.dart';
import 'package:flutter_portfolio/utils/project_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: projectList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveBreakpoints.of(context).isMobile
                  ? 1
                  : ResponsiveBreakpoints.of(context).isTablet
                      ? 2
                      : 3,
              childAspectRatio: ResponsiveBreakpoints.of(context).isMobile
                  ? MediaQuery.of(context).size.width * 0.0035
                  : ResponsiveBreakpoints.of(context).isTablet
                      ? 1.4
                      : 1.3),
          itemBuilder: (context, index) {
            return Padding(
              padding: ResponsiveBreakpoints.of(context).isMobile
                  ? const EdgeInsets.all(4.0)
                  : const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
