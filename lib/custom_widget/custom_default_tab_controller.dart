import 'package:eventy_app/model/event_category_model.dart';
import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';
import 'custom_tab_widget_item.dart';

class CustomDefaultTabController extends StatelessWidget {
  final List<EventCategoryModel> categories;
  final int length;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomDefaultTabController(
      {super.key, required this.categories, required this.length, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Theme(
        data: Theme.of(
          context,
        ).copyWith(splashFactory: NoSplash.splashFactory),
        child: TabBar(
          onTap:onTap,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.symmetric(
            horizontal: context.paddingWidth6,
          ),
          isScrollable: true,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(),
          tabs: categories
              .map(
                (data) => CustomTabWidgetItem(
              eventCategoryModel: data, isSelected: currentIndex==categories.indexOf(data),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
