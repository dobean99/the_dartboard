import 'package:flutter/material.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';

class TitleScreen extends StatelessWidget {
  final String text;
  const TitleScreen({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 48.0,
          color: AppColors.textTitleColor,
          fontWeight: FontWeight.w700,
          shadows: [
            Shadow(
              blurRadius: 2,
              color: AppColors.blackShader,
              offset: Offset(3, -4),
            )
          ],
        ),
      ),
    );
  }
}
