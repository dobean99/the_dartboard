import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  const StrokeText({
    Key? key,
    required this.text,
    this.strokeWidth,
  }) : super(key: key);

  final String text;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w700,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth ?? 8
              ..color = AppColors.textTitleColor,
          ),
        ),
        // ShaderMask(
        //   shaderCallback: (bounds) {
        //     return gradient.createShader(
        //       Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        //     );
        //   },
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
