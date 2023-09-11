import 'package:flutter/material.dart';

class ProjectTagCard extends StatelessWidget {
  final String tagName;
  const ProjectTagCard({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        tagName,
        style: const TextStyle(color: Colors.blue, fontSize: 12),
      ),
    );
  }
}
