import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/widgets/commons/base_layout.dart';
import 'package:the_dartboard/screens/main_menu.dart';
import '../../core/constants/app_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainMenu()));
  }

  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(PngAssets.logo),
          const SpinKitFadingCircle(
            // itemBuilder: (BuildContext context, int index) {
            //   return DecoratedBox(
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: AppColors.whiteColor,
            //         width: 1.0,
            //       ),
            //       borderRadius: BorderRadius.circular(10),
            //       gradient: AppColors.blackToGrey,
            //       // color: index.isEven ? Colors.red : Colors.green,
            //     ),
            //   );
            // },
            color: AppColors.whiteColor,
            size: 200.0,
            duration: Duration(seconds: 1),
          ),
        ],
      ),
    );
  }
}
