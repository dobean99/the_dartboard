import 'package:the_dartboard/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';

class CircleStrokeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CircleStrokeButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: child,
          ),
        ),
      ),
    );
  }
}
