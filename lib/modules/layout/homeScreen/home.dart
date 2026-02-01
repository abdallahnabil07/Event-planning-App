import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:eventy_app/core/theme/app_colors.dart';
import 'package:eventy_app/core/utils/firestore_utils.dart';
import 'package:eventy_app/model/category_list.dart';
import 'package:eventy_app/model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../custom_widget/custom_card_details.dart';
import '../../../custom_widget/custom_default_tab_controller.dart';
import '../../app_provider/app_settings_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettingsProvider>();
    String currentCategoryId = CategoryList.getCategoryId(
      context,
      _currentIndex,
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //welcome back
                  Text(
                    context.appLocalizations.welcome_back,
                    style: context.textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      color: settings.isDark
                          ? AppColors.lightGreyColor
                          : AppColors.darkGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //userName
                  Text(
                    context.appLocalizations.abdullahNabil,
                    style: context.textTheme.titleLarge!.copyWith(
                      color: settings.isDark
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              //theme
              Bounceable(
                onTap: () {
                  settings.toggleTheme();
                },
                child: settings.isDark
                    ? Assets.icons.moon.svg()
                    : Assets.icons.sunRe.svg(),
              ),
              SizedBox(width: context.paddingWidth8),
              //language
              Bounceable(
                onTap: () {
                  settings.toggleLanguage();
                },
                child: Container(
                  width: 34,
                  height: 32,
                  decoration: BoxDecoration(
                    color: settings.isDark
                        ? AppColors.mainDarkModeColor
                        : AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.mainDarkModeColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      settings.currentLanguage.toUpperCase(),
                      style: context.textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: context.paddingHeight24),
            //DefaultTabController
            CustomDefaultTabController(
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              categories: CategoryList.homeCategories(context),
              length: CategoryList.homeCategories(context).length,
            ),
            SizedBox(height: context.paddingHeight24),
            Expanded(
              child: StreamBuilder(
                stream: FirestoreUtils.getStreamDataFromFireStore(
                  currentCategoryId,
                ),
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
                            context.appLocalizations.no_data_found,
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: context.isDark
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CustomCardDetails(dataModel: dataList[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: context.paddingHeight8);
                          },
                          itemCount: dataList.length,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
