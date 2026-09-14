import 'package:event_app/core/app_settings/%20cubit/app_settings_cubit.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/theme/app_colors.dart';
import 'package:event_app/core/widgets/components/error_state_widget.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:event_app/features/events/presentation/widgets/event_card.dart';
import 'package:event_app/features/events/presentation/widgets/event_category_tab_bar.dart';
import 'package:event_app/model/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // ✅ start listening to events stream on init
    final categoryId = CategoryList.getCategoryId(context, _currentIndex);
    context.read<EventsCubit>().getEvents(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettingsCubit>();
    final state = settings.state;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    context.appLocalizations.welcome_back,
                    style: context.textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                      color: context.isDark
                          ? AppColors.textHint
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    context.appLocalizations.abdullahNabil,
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.isDark
                          ? AppColors.surface
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // theme toggle
              Bounceable(
                onTap: () =>
                    context.read<AppSettingsCubit>().toggleTheme(),
                child: context.isDark
                    ? Assets.icons.moon.svg()
                    : Assets.icons.sunRe.svg(),
              ),
              SizedBox(width: 8.w),
              // language toggle
              Bounceable(
                onTap: () =>
                    context.read<AppSettingsCubit>().toggleLanguage(),
                child: Container(
                  width: 34.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: context.isDark
                        ? AppColors.primaryDark
                        : AppColors.primary,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.primaryDark,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      state.language.toUpperCase(),
                      style: context.textTheme.titleMedium!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 24.h),
            // tab bar
            EventCategoryTabBar(
              onTap: (int index) {
                setState(() => _currentIndex = index);
                // ✅ switch stream when category changes
                final categoryId =
                CategoryList.getCategoryId(context, index);
                context.read<EventsCubit>().getEvents(categoryId);
              },
              currentIndex: _currentIndex,
              categories: CategoryList.homeCategories(context),
              length: CategoryList.homeCategories(context).length,
            ),
            SizedBox(height: context.paddingHeight24),
            // ✅ BlocBuilder replaces StreamBuilder
            Expanded(
              child: BlocBuilder<EventsCubit, EventsState>(
                builder: (context, state) {
                  if (state is EventsLoading || state is EventsInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is EventsFailure) {
                    return ErrorStateWidget(
                      onRetry: () {
                        final categoryId = CategoryList.getCategoryId(context, _currentIndex);
                        context.read<EventsCubit>().getEvents(categoryId); // ✅ retry same category
                      },
                    );
                  }

                  if (state is EventsLoaded) {
                    final events = state.events;
                    if (events.isEmpty) {
                      return Center(
                        child: Text(
                          context.appLocalizations.no_data_found,
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: context.isDark
                                ? AppColors.surface
                                : AppColors.textPrimary,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return EventCard(
                          dataModel: events[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.paddingHeight8);
                      },
                      itemCount: events.length,
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}