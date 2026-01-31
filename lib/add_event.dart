import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/custom_widget/custom_app_bar_leading_container.dart';
import 'package:eventy_app/model/category_list.dart';
import 'package:flutter/material.dart';

import 'custom_widget/custom_default_tab_controller.dart';
import 'custom_widget/custom_row_event_date_and_time.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomAppBarLeadingContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          context.appLocalizations.addEvent,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: context.isDark ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //image
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                  vertical: context.paddingHeight16,
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: context.height * 0.21,
                  decoration: BoxDecoration(
                    color: context.isDark
                        ? AppColors.secondDarkModeColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: context.isDark
                          ? AppColors.secondDarkModeColor
                          : AppColors.whiteColorBorder,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      context.isDark
                          ? CategoryList.categories(
                              context,
                            )[_currentIndex].darkImage!
                          : CategoryList.categories(
                              context,
                            )[_currentIndex].image!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //DefaultTabController
              CustomDefaultTabController(
                categories: CategoryList.categories(context),
                length: CategoryList.categories(context).length,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
              ),
              //title
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                  vertical: context.paddingHeight16,
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  context.appLocalizations.title,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    color: context.isDark
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //textFiledEventTitle
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                ),
                child: CustomTextField(
                  hintText: context.appLocalizations.eventTitle,
                ),
              ),
              //Description
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                  vertical: context.paddingHeight16,
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  context.appLocalizations.description,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    color: context.isDark
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //textFiledEventDescription
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                ),
                child: CustomTextField(
                  hintText: context.appLocalizations.eventDescription,
                  maxLine: 6,
                ),
              ),
              //eventData
              CustomRowEventDateAndTime(
                icon: Assets.icons.calendarAdd,
                leftText: context.appLocalizations.eventDate,
                rightTex: context.appLocalizations.chooseDate,
              ),
              //eventTime
              CustomRowEventDateAndTime(
                icon: Assets.icons.clock,
                leftText: context.appLocalizations.eventTime,
                rightTex: context.appLocalizations.chooseTime,
              ),
              //elevatedButton
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                  vertical: context.paddingHeight8,
                ),
                child: CustomElevatedButton(
                  textButton: context.appLocalizations.addEvent,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
