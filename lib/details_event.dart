
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/utils/firestore_utils.dart';
import 'package:eventy_app/custom_widget/app_bar_title_custom_text.dart';
import 'package:eventy_app/custom_widget/app_bar_container_custom.dart';
import 'package:eventy_app/custom_widget/image_top_container_custom.dart';
import 'package:eventy_app/custom_widget/time_date_description_box.dart';
import 'package:eventy_app/model/EventDetailsArgs.dart';
import 'package:eventy_app/model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import 'core/gen/assets.gen.dart';
import 'core/theme/app_colors.dart';
import 'custom_widget/title_description_text_custom.dart';

class DetailsEvent extends StatefulWidget {
  const DetailsEvent({super.key});

  @override
  State<DetailsEvent> createState() => _DetailsEventState();
}

class _DetailsEventState extends State<DetailsEvent> {
  late EventDetailsArgs args;
  late EventDataModel event;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as EventDetailsArgs;
    event = args.event;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CustomAppBarContainer(
          width: context.paddingWidth28,
          height: context.paddingHeight28,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: AppBarTitleCustomText(
          titleText: context.appLocalizations.event_details,
        ),
        actions: [
          //edit
          CustomAppBarContainer(
            icon: Assets.icons.editIcon.svg(),
            width: context.paddingWidth32,
            height: context.paddingHeight32,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutesName.editEvent,
                arguments: args,
              );
            },
          ),
          //delete
          CustomAppBarContainer(
            icon: Assets.icons.deleteIcon.svg(),
            width: context.paddingWidth32,
            height: context.paddingHeight32,
            onTap: () async {
              EasyLoading.show();
              try {
                await FirestoreUtils.deleteEvent(event);
                EasyLoading.dismiss();
                toastification.show(
                  alignment: Alignment.bottomCenter,
                  type: ToastificationType.success,
                  title: Text(context.appLocalizations.deleted_successfully),
                  autoCloseDuration: Duration(seconds: 2),
                );
                Navigator.pop(context);
              } catch (e) {
                EasyLoading.dismiss();
                toastification.show(
                  alignment: Alignment.bottomCenter,
                  type: ToastificationType.error,
                  title: Text(context.appLocalizations.something_went_wrong),
                  autoCloseDuration: Duration(seconds: 2),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //categoryImage
              ImageTopContainerCustom(
                darkImage: event.categoryDarkImage,
                lightImage: event.categoryLightImage,
              ),
              //titleText
              TitleDescriptionTextCustom(text: event.eventTitle),
              //data
              TimeDateDescriptionBox(
                child: Row(
                  children: [
                    CustomAppBarContainer(
                      width: context.width * 0.11,
                      height: context.height * 0.05,
                      onTap: () {},
                      icon: Assets.icons.calendarAdd.svg(),
                    ),
                    Column(
                      children: [
                        //dateText
                        Text(
                          DateFormat('dd MMM').format(event.eventDate),
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: context.isDark
                                ? AppColors.mainDarkModeColor
                                : AppColors.blackColor,
                          ),
                        ),
                        //timeText
                        Text(
                          event.eventTime!.format(context),
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: context.isDark
                                ? AppColors.lightGreyColor
                                : AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //descriptionWord
              TitleDescriptionTextCustom(
                text: context.appLocalizations.description,
              ),
              //description
              TimeDateDescriptionBox(
                child: Text(
                  event.eventDescription,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: context.isDark
                        ? AppColors.lightGreyColor
                        : AppColors.darkGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
