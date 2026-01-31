import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';

class RichTextSignUpIn extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color firstTextColor;
  final Color secondTextColor;
  final VoidCallback onPressed;

  const RichTextSignUpIn({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
    required this.firstTextColor,
    required this.secondTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.textTheme;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: theme.titleMedium!.copyWith(color: firstTextColor),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onPressed,
              child: Text(
                secondText,
                style: theme.titleMedium!.copyWith(
                  color: secondTextColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
