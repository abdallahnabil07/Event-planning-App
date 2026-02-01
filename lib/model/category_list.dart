import 'package:eventy_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import 'event_category_model.dart';

abstract class CategoryList {
  static List<EventCategoryModel> homeCategories(BuildContext context) => [
    // all
    EventCategoryModel(
      id: "all",
      name: context.appLocalizations.all,
      icon: Icons.menu,
    ),
    // sport
    EventCategoryModel(
      id: "sport",
      name: context.appLocalizations.sport,
      icon: Icons.directions_bike_sharp,
    ),
    // birthday
    EventCategoryModel(
      id: "birthday",
      name: context.appLocalizations.birthday,
      icon: Icons.cake,
    ),
    // meeting
    EventCategoryModel(
      id: "meeting",
      name: context.appLocalizations.meeting,
      icon: Icons.groups,
    ),
    // book club
    EventCategoryModel(
      id: "book_club",
      name: context.appLocalizations.book_club,
      icon: Icons.menu_book,
    ),
    // exhibition
    EventCategoryModel(
      id: "exhibition",
      name: context.appLocalizations.exhibition,
      icon: Icons.museum,
    ),
  ];

  static List<EventCategoryModel> categories(BuildContext context) => [
    // sport
    EventCategoryModel(
      id: "sport",
      name: context.appLocalizations.sport,
      image: Assets.images.sportImageSmallLight.path,
      darkImage: Assets.images.sportImageSmallDark.path,
      icon: Icons.directions_bike_sharp,
    ),
    // birthday
    EventCategoryModel(
      id: "birthday",
      name: context.appLocalizations.birthday,
      image: Assets.images.birthdayImageSmallLight.path,
      darkImage: Assets.images.birthdayImageSmallDark.path,
      icon: Icons.cake,
    ),
    // meeting
    EventCategoryModel(
      id: "meeting",
      name: context.appLocalizations.meeting,
      image: Assets.images.meetingImageSmallLight.path,
      darkImage: Assets.images.meetingImageSmallDark.path,
      icon: Icons.groups,
    ),
    // book club
    EventCategoryModel(
      id: "book_club",
      name: context.appLocalizations.book_club,
      image: Assets.images.bookClubImageSmallLight.path,
      darkImage: Assets.images.bookClubImageSmallDark.path,
      icon: Icons.menu_book,
    ),
    // exhibition
    EventCategoryModel(
      id: "exhibition",
      name: context.appLocalizations.exhibition,
      image: Assets.images.exhibitionImageSmallLight.path,
      darkImage: Assets.images.exhibitionImageSmallDark.path,
      icon: Icons.museum,
    ),
  ];

  static String getCategoryId(BuildContext context, int currentIndex) {
    // لو اختار المستخدم tab "all"
    if (currentIndex == 0) return "all";
    return categories(context)[currentIndex - 1].id;
  }
}
