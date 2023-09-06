import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return GestureDetector(
      onTap: () {
        _launchUrl(url);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.25)),
        child: Column(
          children: [
            Row(
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => AppColors.gradient.createShader(
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
                    fontSize: 16))
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
