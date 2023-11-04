import 'package:the_dartboard/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';

class CircleStrokeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final bool isEnable;

  const CircleStrokeButton({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable ? 1 : 0.5,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.bgButtonColor,
          // gradient: AppColors.blackToGrey,
          border: Border.all(
            color: AppColors.whiteColor,
            width: AppConstants.borderWidth,
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: width ?? AppConstants.buttonWidthDefault,
            height: width ?? AppConstants.buttonWidthDefault,
            child: child,
          ),
        ),
      ),
    );
  }
}
