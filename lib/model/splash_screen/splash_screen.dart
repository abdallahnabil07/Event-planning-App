import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          context, AppRoutesName.onBoardingFirstPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Assets.images.logo.image(
              width: sizeW * 0.34,
              height: sizeH * 0.22,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: sizeH * 0.055),
              child: Assets.images.routeLogoSplashFooter.image(
                width: sizeW * 0.34,
                height: sizeH * 0.064,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: sizeH * 0.035),
              child: Text(
                textAlign: TextAlign.center,
                "Supervised by Mohamed Nabil",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
