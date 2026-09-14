import 'package:flutter/material.dart';

class EventEntity {
  final String? eventId;
  final String eventTitle;
  final String eventDescription;
  final DateTime eventDate;
  final TimeOfDay? eventTime;
  final String eventCategoryId;
  final String categoryLightImage;
  final String categoryDarkImage;
  final bool isFavorite;

  const EventEntity({
    this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    this.eventTime,
    required this.eventCategoryId,
    required this.categoryLightImage,
    required this.categoryDarkImage,
    this.isFavorite = false,
  });

  Map<String, dynamic> toFireStore() {
    return {
      "eventTitle": eventTitle,
      "eventDescription": eventDescription,
      "eventTime": eventTime == null
          ? null
          : eventTime!.hour * 60 + eventTime!.minute,
      "eventDate": eventDate.millisecondsSinceEpoch,
      "eventCategoryId": eventCategoryId,
      "categoryLightImage": categoryLightImage,
      "categoryDarkImage": categoryDarkImage,
      "isFavorite": isFavorite,
    };
  }
}
