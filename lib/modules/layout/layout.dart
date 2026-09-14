import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:event_app/features/events/presentation/views/favorite_page.dart';
import 'package:event_app/features/profile/presentation/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/events/presentation/views/home.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> _page = [const Home(), const Favorite(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[context.watch<AppSettingsCubit>().state.currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.isDark
            ? AppColors.primaryDark
            : AppColors.primary,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutesName.addEvent);
        },
        child: const Icon(Icons.add, color: AppColors.surface, size: 24),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadiusGeometry.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          elevation: 20,
          currentIndex: context.watch<AppSettingsCubit>().state.currentIndex,
          onTap: (index) {
            context.read<AppSettingsCubit>().changeCurrentIndex(index);

            // ✅ switch stream based on tab
            if (index == 0) {
              context.read<EventsCubit>().getEvents('all');
            } else if (index == 1) {
              context.read<EventsCubit>().getFavoriteEvents();
            }
          },
          backgroundColor: context.isDark
              ? AppColors.backgroundDark
              : AppColors.surface,
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