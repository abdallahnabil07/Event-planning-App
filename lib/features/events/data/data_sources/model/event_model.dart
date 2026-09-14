import 'package:event_app/features/events/domain/entity/event_entity.dart';
import 'package:flutter/material.dart';

class EventModel extends EventEntity {
  EventModel({
    super.eventId,
    required super.eventTitle,
    required super.eventDescription,
    required super.eventDate,
    super.eventTime,
    required super.eventCategoryId,
    required super.categoryLightImage,
    required super.categoryDarkImage,
    super.isFavorite,
  });

  factory EventModel.fromFireStore(Map<String, dynamic> json, String id) {
    return EventModel(
      eventId: id,
      eventTitle: json["eventTitle"],
      eventDescription: json["eventDescription"],
      eventTime: json["eventTime"] == null
          ? null
          : TimeOfDay(
              hour: json["eventTime"] ~/ 60,
              minute: json["eventTime"] % 60,
            ),
      eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
      eventCategoryId: json["eventCategoryId"],
      categoryLightImage: json["categoryLightImage"],
      categoryDarkImage: json["categoryDarkImage"],
      isFavorite: json["isFavorite"] ?? false,
    );
  }

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

  EventModel copyWith({
    String? eventId,
    String? eventTitle,
    String? eventDescription,
    DateTime? eventDate,
    TimeOfDay? eventTime,
    String? eventCategoryId,
    String? categoryLightImage,
    String? categoryDarkImage,
    bool? isFavorite,
  }) {
    return EventModel(
      eventId: eventId ?? this.eventId,
      eventTitle: eventTitle ?? this.eventTitle,
      eventDescription: eventDescription ?? this.eventDescription,
      eventDate: eventDate ?? this.eventDate,
      eventTime: eventTime ?? this.eventTime,
      eventCategoryId: eventCategoryId ?? this.eventCategoryId,
      categoryLightImage: categoryLightImage ?? this.categoryLightImage,
      categoryDarkImage: categoryDarkImage ?? this.categoryDarkImage,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

//
// class EventDataModel {
//   static const collectionName="EventCollection";
//    String? eventId;
//   final String eventTitle;
//   final String eventDescription;
//   final DateTime eventDate;
//   final TimeOfDay? eventTime;
//   final String eventCategoryId;
//   final String categoryLightImage;
//   final String categoryDarkImage;
//    bool isFavorite;
//
//
//
//   EventDataModel({
//     this.eventId,
//     required this.eventTitle,
//     required this.eventDescription,
//     this.eventTime,
//     required this.eventCategoryId,
//     required this.categoryLightImage,
//     required this.categoryDarkImage,
//     this.isFavorite = false,
//     required this.eventDate,
//   });
//
//   Map<String, dynamic> toFireStore() {
//     return {
//       "eventId": eventId,
//       "eventTitle": eventTitle,
//       "eventDescription": eventDescription,
//       "eventTime": eventTime == null
//           ? null
//           : eventTime!.hour * 60 + eventTime!.minute,
//       "eventDate": eventDate.millisecondsSinceEpoch,
//       "eventCategoryId": eventCategoryId,
//       "categoryLightImage": categoryLightImage,
//       "categoryDarkImage": categoryDarkImage,
//       "isFavorite": isFavorite,
//     };
//   }
//
//  factory EventDataModel.fromFireStore(Map<String, dynamic> json) {
//     return EventDataModel(
//       eventId: json["eventId"],
//       eventTitle: json["eventTitle"],
//       eventDescription: json["eventDescription"],
//       eventTime: json["eventTime"] == null
//           ? null
//           : TimeOfDay(
//               hour: json["eventTime"] ~/ 60,
//               minute: json["eventTime"] % 60,
//             ),
//       eventDate: DateTime.fromMillisecondsSinceEpoch(json["eventDate"]),
//       eventCategoryId: json["eventCategoryId"],
//       categoryLightImage: json["categoryLightImage"],
//       categoryDarkImage: json["categoryDarkImage"],
//       isFavorite: json["isFavorite"],
//     );
//   }
// }
