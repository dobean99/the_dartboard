import 'package:the_dartboard/config/assets/assets.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              PngAssets.backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child ?? const Center(),
      ),
    );
  }
}
