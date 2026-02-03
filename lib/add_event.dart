import 'package:eventy_app/components/custom_elevated_button.dart';
import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/core/utils/firestore_utils.dart';
import 'package:eventy_app/custom_widget/app_bar_title_custom_text.dart';
import 'package:eventy_app/custom_widget/app_bar_container_custom.dart';
import 'package:eventy_app/model/category_list.dart';
import 'package:eventy_app/model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import 'core/l10n/app_localizations.dart';
import 'custom_widget/custom_default_tab_controller.dart';
import 'custom_widget/custom_row_event_date_and_time.dart';
import 'custom_widget/image_top_container_custom.dart';
import 'custom_widget/title_description_text_custom.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int _currentIndex = 0;
  DateTime? selectedEventData;
  TimeOfDay? selectedEventTime;

  AppLocalizations get appLocalizations => AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomAppBarContainer(
          width: context.paddingWidth28,
          height: context.paddingHeight28,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: AppBarTitleCustomText(
          titleText: context.appLocalizations.addEvent,
        ),
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //image
                ImageTopContainerCustom(
                  lightImage: CategoryList.categories(
                    context,
                  )[_currentIndex].image,
                  darkImage: CategoryList.categories(
                    context,
                  )[_currentIndex].darkImage,
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
                TitleDescriptionTextCustom(text: context.appLocalizations.title,),
                //textFiledEventTitle
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingWidth16,
                  ),
                  child: CustomTextField(
                    validator: validate,
                    controller: titleController,
                    hintText: context.appLocalizations.eventTitle,
                  ),
                ),
                //Description
                TitleDescriptionTextCustom(text: context.appLocalizations.description,),
                //textFiledEventDescription
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingWidth16,
                  ),
                  child: CustomTextField(
                    validator: validate,
                    controller: descriptionController,
                    hintText: context.appLocalizations.eventDescription,
                    maxLine: 6,
                  ),
                ),
                //eventData
                CustomRowEventDateAndTime(
                  onTap: getSelectedDate,
                  icon: Assets.icons.calendarAdd,
                  leftText: context.appLocalizations.eventDate,
                  rightTex: selectedEventData != null
                      ? (DateFormat("dd,MMM yyyy").format(selectedEventData!))
                      : context.appLocalizations.chooseDate,
                ),
                //eventTime
                CustomRowEventDateAndTime(
                  onTap: getSelectedTime,
                  icon: Assets.icons.clock,
                  leftText: context.appLocalizations.eventTime,
                  rightTex: selectedEventTime != null
                      ? selectedEventTime!.format(context)
                      : context.appLocalizations.chooseTime,
                ),
                //elevatedButton
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingWidth16,
                  ),
                  child: CustomElevatedButton(
                    textButton: context.appLocalizations.addEvent,
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        if (selectedEventData == null) {
                          toastification.show(
                            type: ToastificationType.error,
                            alignment: Alignment.bottomCenter,
                            title: Text(
                              context.appLocalizations.select_event_date,
                            ),
                            autoCloseDuration: const Duration(seconds: 5),
                          );
                          return;
                        }
                        if (selectedEventTime == null) {
                          toastification.show(
                            type: ToastificationType.error,
                            alignment: Alignment.bottomCenter,
                            title: Text(
                              context.appLocalizations.select_event_time,
                            ),
                            autoCloseDuration: const Duration(seconds: 5),
                          );
                          return;
                        }
                        EventDataModel data = EventDataModel(
                          eventTitle: titleController.text,
                          eventDescription: descriptionController.text,
                          eventTime: selectedEventTime!,
                          eventCategoryId: CategoryList.categories(
                            context,
                          )[_currentIndex].id,
                          categoryLightImage: CategoryList.categories(
                            context,
                          )[_currentIndex].image!,
                          categoryDarkImage: CategoryList.categories(
                            context,
                          )[_currentIndex].darkImage!,
                          eventDate: selectedEventData!,
                        );
                        EasyLoading.show();
                        FirestoreUtils.addEvent(data).then((value) {
                          EasyLoading.dismiss();
                          if (value) {
                            toastification.show(
                              type: ToastificationType.success,
                              alignment: Alignment.bottomCenter,
                              title: Text(
                                appLocalizations.event_created_successfully,
                              ),
                              autoCloseDuration: const Duration(seconds: 5),
                            );
                            Navigator.pop(context);
                          } else {
                            toastification.show(
                              type: ToastificationType.error,
                              alignment: Alignment.bottomCenter,
                              title: Text(appLocalizations.unable_to_add_event),
                              autoCloseDuration: const Duration(seconds: 5),
                            );
                          }
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.required;
    }
    return null;
  }

  void getSelectedDate() async {
    var currentTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {
      selectedEventData = currentTime;
    });
  }

  void getSelectedTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedEventTime = time;
      });
    }
  }
}
