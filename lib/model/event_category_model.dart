import 'package:flutter/material.dart';

class EventCategoryModel {
  final String id;
  final String name;
  final String? image;
  final String? darkImage;
  final IconData icon;

  EventCategoryModel({
    required this.id,
    required this.name,
     this.image,
     this.darkImage,
    required this.icon,
  });
}
