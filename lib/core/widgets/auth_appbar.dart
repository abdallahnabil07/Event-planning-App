import 'package:flutter/material.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final topImage = isDark
        ? Assets.images.logoTopDarkMode
        : Assets.images.logoTopLightMode;
    return AppBar(
      automaticallyImplyLeading: false,
      title: topImage.image(
        width: context.width * 0.36,
        height: context.height * 0.03,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}