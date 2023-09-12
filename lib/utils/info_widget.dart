import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:flutter_portfolio/services/launcher_services.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final String url;
  const IconWidget({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    Launcher _launcher = Launcher();
    return GestureDetector(
      onTap: () {
        _launcher.openSocials(url);
      },
      child: Container(
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
    );
  }
}
