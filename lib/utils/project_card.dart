import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  const ProjectCard(
      {super.key,
      required this.title,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8), topRight: Radius.circular(8)),
          color: Colors.white.withOpacity(0.4)),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(FontAwesomeIcons.bookBookmark),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 16))
            ],
          )
        ],
      ),
    );
  }
}
