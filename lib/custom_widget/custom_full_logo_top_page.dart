import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';

class CustomFullLogoTopPage extends StatelessWidget {
  const CustomFullLogoTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = context.width;
    final sizeH = context.height;
    return Align(
      alignment: Alignment.topCenter,
      child: Assets.images.logo.image(
        width: sizeW * 0.76,
        height: sizeH * 0.34,
      ),
    );
  }
}
