import 'package:eventy_app/core/routes/app_routes_name.dart';
import 'package:eventy_app/core/utils/firestore_utils.dart';
import 'package:eventy_app/model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';

import '../core/extensions/context_extensions.dart';
import '../core/gen/assets.gen.dart';
import '../core/theme/app_colors.dart';

class CustomCardDetails extends StatelessWidget {
  final EventDataModel dataModel;

  const CustomCardDetails({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingWidth16),
      child: Bounceable(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutesName.detailsEvent,
              arguments: dataModel,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            height: context.height * 0.21,
            decoration: BoxDecoration(
              color: context.isDark
                  ? AppColors.secondDarkModeColor
                  : AppColors.whiteColor,
              border: Border.all(
                color: context.isDark
                    ? AppColors.strokeDarkModeColor
                    : AppColors.whiteColorBorder,
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
                //topBox
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: context.width * 0.16,
                    height: context.height * 0.045,
                    decoration: BoxDecoration(
                      color: context.isDark
                          ? AppColors.darkModeColor
                          : AppColors.backgroundLight,
                      border: Border.all(
                        color: context.isDark
                            ? AppColors.strokeDarkModeColor
                            : AppColors.whiteColorBorder,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        DateFormat('dd MMM').format(dataModel.eventDate),
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.isDark
                              ? AppColors.mainDarkModeColor
                              : AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                //bottomBox
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      // height: 40,
                      decoration: BoxDecoration(
                        color: context.isDark
                            ? AppColors.darkModeColor
                            : AppColors.backgroundLight,
                        border: Border.all(
                          color: context.isDark
                              ? AppColors.strokeDarkModeColor
                              : AppColors.whiteColorBorder,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              dataModel.eventTitle,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.isDark
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
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
