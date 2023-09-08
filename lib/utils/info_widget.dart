import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
