import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/custom_widget/custom_default_tab_controller.dart';
import 'package:eventy_app/model/category_list.dart';
import 'package:eventy_app/model/event_category_model.dart';
import 'package:eventy_app/model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_text_field.dart';
import 'core/extensions/context_extensions.dart';
import 'core/gen/assets.gen.dart';
import 'core/utils/firestore_utils.dart';
import 'custom_widget/app_bar_container_custom.dart';
import 'custom_widget/app_bar_title_custom_text.dart';
import 'custom_widget/custom_row_event_date_and_time.dart';
import 'custom_widget/image_top_container_custom.dart';
import 'custom_widget/title_description_text_custom.dart';
import 'model/EventDetailsArgs.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  int selectedIndex = 0;
  EventDataModel? event;
  late EventCategoryModel selectedCategory;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  DateTime? updateDate;
  TimeOfDay? updateTime;
  bool isInitialized = false;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final data =
          ModalRoute.of(context)!.settings.arguments as EventDetailsArgs;
      setState(() {
        event = data.event;
        selectedCategory =
            data.category ??
            CategoryList.categories(
              context,
            ).firstWhere((c) => c.id == event!.eventCategoryId);
        titleController.text = event!.eventTitle;
        descriptionController.text = event!.eventDescription;
        isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized || event == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final index = CategoryList.categories(
      context,
    ).indexWhere((c) => c.id == selectedCategory.id);
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
          titleText: context.appLocalizations.event_edit,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Column(
            spacing: context.paddingHeight8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //topImage
              ImageTopContainerCustom(
                darkImage:
                    selectedCategory.darkImage ?? event!.categoryDarkImage,
                lightImage: selectedCategory.image ?? event!.categoryLightImage,
              ),
              //defaultController
              CustomDefaultTabController(
                categories: CategoryList.categories(context),
                length: CategoryList.categories(context).length,
                currentIndex: index,
                onTap: (index) {
                  setState(() {
                    selectedCategory = CategoryList.categories(context)[index];
                  });
                },
              ),
              //titleWord
              TitleDescriptionTextCustom(text: context.appLocalizations.title),
              //textFormFiled(title Details)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                ),
                child: CustomTextField(
                  validator: validate,
                  controller: titleController,
                ),
              ),
              //descriptionWord
              TitleDescriptionTextCustom(
                text: context.appLocalizations.description,
              ),
              //textFormFiled(description Details)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                ),
                child: CustomTextField(
                  validator: validate,
                  controller: descriptionController,
                ),
              ),
              //eventData
              CustomRowEventDateAndTime(
                onTap: () {
                  getSelectedDate();
                },
                icon: Assets.icons.calendarAdd,
                leftText: context.appLocalizations.eventDate,
                rightTex: DateFormat(
                  'dd MMM',
                ).format(updateDate ?? event!.eventDate),
              ),
              //eventTime
              CustomRowEventDateAndTime(
                onTap: () {
                  getSelectedTime();
                },
                icon: Assets.icons.clock,
                leftText: context.appLocalizations.eventTime,
                rightTex: (updateTime ?? event!.eventTime)!.format(context),
              ),
              //elevatedButton
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingWidth16,
                ),
                child: CustomElevatedButton(
                  textButton: context.appLocalizations.update_event,
                  onPressed: () async {
                    if (_globalKey.currentState!.validate()) {
                      if (!hasChanges()) {
                        toastification.show(
                          alignment: Alignment.bottomCenter,
                          type: ToastificationType.warning,
                          title: Text(
                            context.appLocalizations.no_changes_detected,
                          ),
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                        return;
                      }
                      await updateEvent();
                    }
                  },
                ),
              ),
            ],
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
      updateDate = currentTime;
    });
  }

  void getSelectedTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        updateTime = time;
      });
    }
  }

  Future<void> updateEvent() async {
    EasyLoading.show();

    try {
      final updatedEvent = EventDataModel(
        eventId: event!.eventId,
        eventTitle: titleController.text,
        eventDescription: descriptionController.text,
        eventDate: updateDate ?? event!.eventDate,
        eventTime: updateTime ?? event!.eventTime,
        eventCategoryId: selectedCategory.id,
        categoryLightImage: selectedCategory.image!,
        categoryDarkImage: selectedCategory.darkImage!,
      );

      await FirestoreUtils.updateEvent(updatedEvent);

      EasyLoading.dismiss();

      toastification.show(
        alignment: Alignment.bottomCenter,
        type: ToastificationType.success,
        title: Text(context.appLocalizations.update_successfully),
        autoCloseDuration: const Duration(seconds: 2),
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesName.homeScreen,
        (route) => false,
      );
    } catch (e) {
      EasyLoading.dismiss();

      toastification.show(
        alignment: Alignment.bottomCenter,
        type: ToastificationType.error,
        title: Text(context.appLocalizations.something_went_wrong),
        autoCloseDuration: const Duration(seconds: 2),
      );
    }
  }

  bool hasChanges() {
    final originalTitle = event!.eventTitle.trim();
    final originalDescription = event!.eventDescription.trim();
    final newTitle = titleController.text.trim();
    final newDescription = descriptionController.text.trim();

    final titleChanged = newTitle != originalTitle;
    final descriptionChanged = newDescription != originalDescription;

    final dateChanged = updateDate != null;
    final timeChanged = updateTime != null;

    final categoryChanged = selectedCategory.id != event!.eventCategoryId;

    return titleChanged ||
        descriptionChanged ||
        timeChanged ||
        dateChanged ||
        categoryChanged;
  }
}
