import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';

class CustomLogoTopPage extends StatelessWidget {
  const CustomLogoTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: sizeH * 0.04),
        child: Assets.images.eventlyLogoTopChange.image(
          width: sizeW * 0.42,
          height: sizeH * 0.056,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
