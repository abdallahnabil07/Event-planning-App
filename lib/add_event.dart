import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/core/widgets/components/app_text_field.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/widgets/appbar_icon_button.dart';
import 'package:event_app/core/widgets/appbar_title.dart';
import 'package:event_app/features/events/presentation/widgets/event_category_tab_bar.dart';
import 'package:event_app/core/widgets/event_info_row.dart';
import 'package:event_app/core/widgets/hero_image_container.dart';
import 'package:event_app/core/widgets/section_label.dart';
import 'package:event_app/model/category_list.dart';
import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:event_app/features/events/presentation/cubit/events_cubit.dart';
import 'package:event_app/core/widgets/components/toastification_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

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

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoryList.categories(context);

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
            title: context.appLocalizations.event_created_successfully,
          );
          Navigator.pop(context);
        }

        if (state is EventsFailure) {
          ToastificationCustom.show(
            context,
            type: ToastificationType.error,
            title: context.appLocalizations.unable_to_add_event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIconButton(
            width: context.paddingWidth28,
            height: context.paddingHeight28,
            onTap: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: AppBarTitle(titleText: context.appLocalizations.addEvent),
          actions: const [],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // image
                  HeroImageContainer(
                    lightImage: categories[_currentIndex].image,
                    darkImage: categories[_currentIndex].darkImage,
                  ),
                  // tab bar
                  EventCategoryTabBar(
                    categories: categories,
                    length: categories.length,
                    onTap: (int index) {
                      setState(() => _currentIndex = index);
                    },
                    currentIndex: _currentIndex,
                  ),
                  // title
                  SectionLabel(text: context.appLocalizations.title),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppTextField(
                      validator: (v) => v == null || v.trim().isEmpty
                          ? context.appLocalizations.required
                          : null,
                      controller: titleController,
                      hintText: context.appLocalizations.eventTitle,
                    ),
                  ),
                  // description
                  SectionLabel(text: context.appLocalizations.description),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppTextField(
                      validator: (v) => v == null || v.trim().isEmpty
                          ? context.appLocalizations.required
                          : null,
                      controller: descriptionController,
                      hintText: context.appLocalizations.eventDescription,
                      maxLine: 6,
                    ),
                  ),
                  // event date
                  EventInfoRow(
                    onTap: getSelectedDate,
                    icon: Assets.icons.calendarAdd,
                    leftText: context.appLocalizations.eventDate,
                    rightText: selectedEventData != null
                        ? DateFormat("dd,MMM yyyy").format(selectedEventData!)
                        : context.appLocalizations.chooseDate,
                  ),
                  // event time
                  EventInfoRow(
                    onTap: getSelectedTime,
                    icon: Assets.icons.clock,
                    leftText: context.appLocalizations.eventTime,
                    rightText: selectedEventTime != null
                        ? selectedEventTime!.format(context)
                        : context.appLocalizations.chooseTime,
                  ),
                  // add button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: AppElevatedButton(
                      textButton: context.appLocalizations.addEvent,
                      onPressed: _addEvent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addEvent() {
    if (!_globalKey.currentState!.validate()) return;

    if (selectedEventData == null) {
      ToastificationCustom.show(
        context,
        type: ToastificationType.error,
        title: context.appLocalizations.select_event_date,
      );
      return;
    }

    if (selectedEventTime == null) {
      ToastificationCustom.show(
        context,
        type: ToastificationType.error,
        title: context.appLocalizations.select_event_time,
      );
      return;
    }

    final categories = CategoryList.categories(context);

    // ✅ use EventEntity instead of EventDataModel
    final event = EventEntity(
      eventTitle: titleController.text,
      eventDescription: descriptionController.text,
      eventTime: selectedEventTime!,
      eventCategoryId: categories[_currentIndex].id,
      categoryLightImage: categories[_currentIndex].image!,
      categoryDarkImage: categories[_currentIndex].darkImage!,
      eventDate: selectedEventData!,
    );

    context.read<EventsCubit>().addEvent(event); // ✅ cubit handles the rest
  }

  void getSelectedDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(() => selectedEventData = date);
  }

  void getSelectedTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) setState(() => selectedEventTime = time);
  }
}