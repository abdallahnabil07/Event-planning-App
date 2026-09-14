import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/widgets/appbar_icon_button.dart';
import 'package:event_app/core/widgets/appbar_title.dart';
import 'package:event_app/core/widgets/components/app_elevated_button.dart';
import 'package:event_app/core/widgets/components/app_text_field.dart';
import 'package:event_app/features/events/presentation/widgets/event_category_tab_bar.dart';
import 'package:event_app/core/widgets/event_info_row.dart';
import 'package:event_app/core/widgets/hero_image_container.dart';
import 'package:event_app/core/widgets/section_label.dart';
import 'package:event_app/model/category_list.dart';
import 'package:event_app/model/event_category_model.dart';
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
import 'core/extensions/context_extensions.dart';
import 'core/gen/assets.gen.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  EventEntity? event;
  late EventCategoryModel selectedCategory;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late EventDetailsArgs args;

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
      args = ModalRoute.of(context)!.settings.arguments as EventDetailsArgs;
      setState(() {
        event = args.event;
        selectedCategory = args.category ??
            CategoryList.categories(context).firstWhere(
                  (c) => c.id == event!.eventCategoryId,
            );
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

    final categories = CategoryList.categories(context);
    final index = categories.indexWhere((c) => c.id == selectedCategory.id);

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
            title: context.appLocalizations.update_successfully,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutesName.homeScreen,
                (route) => false,
          );
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
          title: AppBarTitle(titleText: context.appLocalizations.event_edit),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              spacing: context.paddingHeight8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // image
                HeroImageContainer(
                  darkImage: selectedCategory.darkImage ?? event!.categoryDarkImage,
                  lightImage: selectedCategory.image ?? event!.categoryLightImage,
                ),
                // tab bar
                EventCategoryTabBar(
                  categories: categories,
                  length: categories.length,
                  currentIndex: index,
                  onTap: (index) {
                    setState(() => selectedCategory = categories[index]);
                  },
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
                  ),
                ),
                // event date
                EventInfoRow(
                  onTap: getSelectedDate,
                  icon: Assets.icons.calendarAdd,
                  leftText: context.appLocalizations.eventDate,
                  rightText: DateFormat('dd MMM').format(
                    updateDate ?? event!.eventDate,
                  ),
                ),
                // event time
                EventInfoRow(
                  onTap: getSelectedTime,
                  icon: Assets.icons.clock,
                  leftText: context.appLocalizations.eventTime,
                  rightText: (updateTime ?? event!.eventTime)!.format(context),
                ),
                // update button
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: AppElevatedButton(
                    textButton: context.appLocalizations.update_event,
                    onPressed: _update,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update() {
    if (!_globalKey.currentState!.validate()) return;

    if (!hasChanges()) {
      ToastificationCustom.show(
        context,
        type: ToastificationType.warning,
        title: context.appLocalizations.no_changes_detected,
      );
      return;
    }

    // ✅ use EventEntity
    final updatedEvent = EventEntity(
      eventId: event!.eventId,
      eventTitle: titleController.text,
      eventDescription: descriptionController.text,
      eventDate: updateDate ?? event!.eventDate,
      eventTime: updateTime ?? event!.eventTime,
      eventCategoryId: selectedCategory.id,
      categoryLightImage: selectedCategory.image!,
      categoryDarkImage: selectedCategory.darkImage!,
    );

    context.read<EventsCubit>().updateEvent(updatedEvent); // ✅
  }

  void getSelectedDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    setState(() => updateDate = date);
  }

  void getSelectedTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) setState(() => updateTime = time);
  }

  bool hasChanges() {
    final titleChanged = titleController.text.trim() != event!.eventTitle.trim();
    final descriptionChanged =
        descriptionController.text.trim() != event!.eventDescription.trim();
    final dateChanged = updateDate != null;
    final timeChanged = updateTime != null;
    final categoryChanged = selectedCategory.id != event!.eventCategoryId;

    return titleChanged || descriptionChanged || timeChanged ||
        dateChanged || categoryChanged;
  }
}