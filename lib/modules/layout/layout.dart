import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/modules//layout/favorite/favorite_page.dart';
import 'package:eventy_app/modules//layout/profile/profile_page.dart';
import 'package:flutter/material.dart';

import 'homeScreen/home.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> _page = [Home(), Favorite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[context.provider.currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.isDark? AppColors.mainDarkModeColor:AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutesName.addEvent);
        },
        child: Icon(Icons.add,color: AppColors.whiteColor,size: 24,),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          elevation: 20,
          currentIndex: context.provider.currentIndex,
          onTap: context.provider.changeCurrentIndex,
          backgroundColor: context.isDark
              ? AppColors.darkModeColor
              : AppColors.whiteColor,

          items: [
            BottomNavigationBarItem(
              label: context.appLocalizations.home,
              icon: context.isDark
                  ? Assets.icons.homeIconDark.svg()
                  : Assets.icons.homeIcon.svg(),
              activeIcon: context.isDark
                  ? Assets.icons.homeIconSelectedDark.svg()
                  : Assets.icons.homeIconSelected.svg(),
            ),
            BottomNavigationBarItem(
              label: context.appLocalizations.favorite,
              icon: context.isDark
                  ? Assets.icons.favoriteIconDark.svg()
                  : Assets.icons.favoriteIcon.svg(),
              activeIcon: context.isDark
                  ? Assets.icons.favoriteIconSelectedDark.svg()
                  : Assets.icons.favoriteIconSelected.svg(),
            ),
            BottomNavigationBarItem(
              label: context.appLocalizations.profile,
              icon: context.isDark
                  ? Assets.icons.userDark.svg()
                  : Assets.icons.user.svg(),
              activeIcon: context.isDark
                  ? Assets.icons.userSelectedDark.svg()
                  : Assets.icons.userSelected.svg(),
            ),
          ],
        ),
      ),
    );
  }
}
