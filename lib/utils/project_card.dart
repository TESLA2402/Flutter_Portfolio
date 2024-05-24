import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:flutter_portfolio/services/launcher_services.dart';
import 'package:flutter_portfolio/utils/tag_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final int stars;
  final List<String> tags;
  const ProjectCard(
      {super.key,
      required this.title,
      required this.description,
      required this.url,
      required this.stars,
      required this.tags});

  @override
  Widget build(BuildContext context) {
    Launcher launch = Launcher();
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          launch.openSocials(url);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.27,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.8),
            boxShadow: [
              ResponsiveBreakpoints.of(context).isMobile
                  ? const BoxShadow()
                  : const BoxShadow(
                      color: Colors.white,
                      spreadRadius: 0,
                      blurRadius: 5,
                      blurStyle: BlurStyle.solid)
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.gradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.bookBookmark,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(title,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w200,
                            fontSize: 16)),
                    const Spacer(),
                    const Icon(
                      FontAwesomeIcons.github,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(description,
                    maxLines: 3,
                    style: const TextStyle(
                        overflow: TextOverflow.fade,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 16)),
                const SizedBox(
                  height: 12,
                ),
                Wrap(direction: Axis.horizontal, children: [
                  for (int i = 0; i < tags.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ProjectTagCard(tagName: tags[i].toLowerCase()),
                    )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
