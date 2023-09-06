import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const InfoCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.6),
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  offset: Offset.zero,
                  blurRadius: 2,
                  blurStyle: BlurStyle.solid)
            ],
          ),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => AppColors.gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Icon(icon),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
