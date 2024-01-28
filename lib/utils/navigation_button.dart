import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/services/switch_screens.dart';
import 'package:flutter_portfolio/constants/color.dart';
import 'package:provider/provider.dart';

class NavigationButton extends StatelessWidget {
  final int index;
  final String title;

  const NavigationButton({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        context.watch<NavigationViewModel>().screenIndex == index
            ? ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => AppColors.gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: SelectableText.rich(
                  TextSpan(
                    text: title,
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.read<NavigationViewModel>().screenIndex = index;
                        context.read<NavigationViewModel>().screenName = title;
                      },
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 16),
                  ),
                ),
              )
            : SelectableText.rich(
                TextSpan(
                  text: title,
                  mouseCursor: SystemMouseCursors.click,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.read<NavigationViewModel>().screenIndex = index;
                      context.read<NavigationViewModel>().screenName = title;
                    },
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 16),
                ),
              ),
        const SizedBox(
          width: 48,
        ),
      ],
    );
  }
}
