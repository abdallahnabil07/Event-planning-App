import 'package:event_app/core/gen/assets.gen.dart';
import 'package:event_app/core/routes/app_routes_name.dart';
import 'package:event_app/core/utils/firestore_utils.dart';
import 'package:event_app/model/event_details_args.dart';
import 'package:event_app/model/event_category_model.dart';
import 'package:event_app/features/events/data/data_sources/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';
import 'package:event_app/core/extensions/context_extensions.dart';
import 'package:event_app/core/theme/app_colors.dart';

class EventCard extends StatelessWidget {
  final EventDataModel dataModel;
  final EventCategoryModel? eventCategoryModel;

  const EventCard({
    super.key,
    required this.dataModel,
    this.eventCategoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingWidth16),
      child: Bounceable(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutesName.eventDetails,
            arguments: EventDetailsArgs(
              event: dataModel,
              category: eventCategoryModel,
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            height: context.height * 0.21,
            decoration: BoxDecoration(
              color: context.isDark
                  ? AppColors.surfaceDark
                  : AppColors.surface,
              border: Border.all(
                color: context.isDark
                    ? AppColors.borderDark
                    : AppColors.borderLight,
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  context.isDark
                      ? dataModel.categoryDarkImage
                      : dataModel.categoryLightImage,
                ),
                // topBox
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: context.width * 0.16,
                    height: context.height * 0.045,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? AppColors.backgroundDark
                          : AppColors.backgroundLight,
                      border: Border.all(
                        color: context.isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        DateFormat('dd MMM').format(dataModel.eventDate),
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.isDark
                              ? AppColors.primaryDark
                              : AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // bottomBox
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.isDark
                            ? AppColors.backgroundDark
                            : AppColors.backgroundLight,
                        border: Border.all(
                          color: context.isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              dataModel.eventTitle,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.isDark
                                    ? AppColors.surface
                                    : AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Bounceable(
                              onTap: () {
                                dataModel.isFavorite = !dataModel.isFavorite;
                                FirestoreUtils.updateEvent(dataModel);
                              },
                              child: dataModel.isFavorite
                                  ? Assets.icons.heartSelected.svg()
                                  : Assets.icons.heart.svg(),
                            ),
                          ],
                        ),
                      ),
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