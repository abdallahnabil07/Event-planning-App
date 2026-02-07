import 'package:eventy_app/components/custom_text_field.dart';
import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/gen/assets.gen.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '/core/utils/firestore_utils.dart';
import '/custom_widget/custom_card_details.dart';
import '/model/event_data_model.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: double.infinity,
            height: 48,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: CustomTextField(
                hintText: context.appLocalizations.search_for_event,
                fillColor: context.isDark
                    ? AppColors.secondDarkModeColor
                    : AppColors.whiteColor,
                borderColor: context.isDark
                    ? AppColors.strokeDarkModeColor
                    : AppColors.whiteColorBorder,
                iconPosition: IconPosition.end,
                icon: Assets.icons.search,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: context.paddingHeight16),
              Expanded(
                child: StreamBuilder(
                  stream: FirestoreUtils.getStreamFavoriteDataFromFireStore(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      Text(snapshot.error.toString());
                    }
                    List<EventDataModel> dataList = snapshot.data!.docs.map((
                      element,
                    ) {
                      return element.data();
                    }).toList();

                    return dataList.isEmpty
                        ? Center(
                            child: Text(
                              context.appLocalizations.no_favorite_event_found,
                              style: context.textTheme.bodyMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: context.isDark
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CustomCardDetails(
                                  dataModel: dataList[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: context.paddingHeight8);
                              },
                              itemCount: dataList.length,
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
