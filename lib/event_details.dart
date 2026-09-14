import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/widgets/appbar_icon_button.dart';
import 'package:event_app/core/widgets/appbar_title.dart';
import 'package:event_app/core/widgets/event_info_box.dart';
import 'package:event_app/core/widgets/hero_image_container.dart';
import 'package:event_app/core/widgets/section_label.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:event_app/core/widgets/components/toastification_custom.dart';
import 'package:event_app/model/event_details_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import 'core/gen/assets.gen.dart';
import 'core/theme/app_colors.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late EventDetailsArgs args;
  late EventEntity event;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as EventDetailsArgs;
    event = args.event;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventsCubit, EventsState>(
      listener: (context, state) {
        if (state is EventsLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }

        if (state is EventsOperationSuccess) {
          ToastificationCustom.show(
            context,
            type: ToastificationType.success,
            title: context.appLocalizations.deleted_successfully,
          );
          Navigator.pop(context);
        }

        if (state is EventsFailure) {
          ToastificationCustom.show(
            context,
            type: ToastificationType.error,
            title: context.appLocalizations.something_went_wrong,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: AppBarIconButton(
            width: context.paddingWidth28,
            height: context.paddingHeight28,
            onTap: () => Navigator.pop(context),
          ),
          title: AppBarTitle(
            titleText: context.appLocalizations.event_details,
          ),
          actions: [
            // edit
            AppBarIconButton(
              icon: Assets.icons.editIcon.svg(),
              width: context.paddingWidth32,
              height: context.paddingHeight32,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutesName.editEvent,
                arguments: args,
              ),
            ),
            // delete
            AppBarIconButton(
              icon: Assets.icons.deleteIcon.svg(),
              width: context.paddingWidth32,
              height: context.paddingHeight32,
              onTap: () => context.read<EventsCubit>().deleteEvent(event), // ✅
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // category image
                HeroImageContainer(
                  darkImage: event.categoryDarkImage,
                  lightImage: event.categoryLightImage,
                ),
                // title
                SectionLabel(text: event.eventTitle),
                // date & time
                EventInfoBox(
                  child: Row(
                    children: [
                      AppBarIconButton(
                        width: 41.w,
                        height: 41.h,
                        onTap: () {},
                        icon: Assets.icons.calendarAdd.svg(),
                      ),
                      Column(
                        children: [
                          Text(
                            DateFormat('dd MMM').format(event.eventDate),
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontSize: 16.sp,
                              color: context.isDark
                                  ? AppColors.primaryDark
                                  : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            event.eventTime!.format(context),
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: context.isDark
                                  ? AppColors.textHint
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // description label
                SectionLabel(text: context.appLocalizations.description),
                // description
                EventInfoBox(
                  child: Text(
                    event.eventDescription,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: context.isDark
                          ? AppColors.textHint
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}