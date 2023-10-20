import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/config/router_config.dart';
import 'package:todo_app/src/constants/color.dart';
import 'package:todo_app/src/constants/routes_path.dart';
import 'package:todo_app/src/data/shared_preferences.dart';
import 'package:todo_app/src/reusables/custom_text.dart';
import 'package:todo_app/src/reusables/dimension.dart';

import '../reusables/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      startImageSwitchTimer();
    });
  }

  Future<void> startImageSwitchTimer() async {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      routerConfig.pushReplacement(RoutesPath.homeScreen);
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 4.0,
                  left: 0.0,
                  child: CustomText(
                    requiredText: 'To-Do List',
                    color: MyColor.textColor.withOpacity(0.6),
                    fontSize: MyDimension.dim35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CustomText(
                  requiredText: 'To-Do List',
                  color: MyColor.appColor,
                  fontSize: MyDimension.dim35,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: CustomText(
                requiredText: 'Let\'s do this',
                color: MyColor.appColor.withOpacity(0.7),
                fontSize: MyDimension.dim22,
              ),
            ),
            10.verticalSpace,
            const LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
