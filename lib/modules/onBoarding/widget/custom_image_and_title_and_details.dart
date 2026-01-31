import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';
import 'custom_logo_top_page.dart';

class CustomImageAndTitleAndDetails extends StatelessWidget {
  final AssetGenImage image;
  final String title;
  final String details;

  const CustomImageAndTitleAndDetails({
    super.key,
    required this.image,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomLogoTopPage(),
        Padding(
          padding: EdgeInsets.only(
            top: sizeH * 0.072,
            left: sizeW * 0.041,
            right: sizeW * 0.041,
          ),
          child: SizedBox(
            width: sizeW * 0.92,
            height: sizeH * 0.41,
            child: image.image(fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sizeH * 0.031,
            left: sizeW * 0.041,
            right: sizeW * 0.041,
          ),

          child: Text(
              textAlign: TextAlign.start,
              title,
              style: theme.titleLarge,
            ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sizeH * 0.031,
            left: sizeW * 0.041,
            right: sizeW * 0.041,
          ),
          child: Text(
            textAlign: TextAlign.start,
            details,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
