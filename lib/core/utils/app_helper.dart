import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

 class AppHelper {
  static String? validate(String? value,BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return context.appLocalizations.required;
    }
    return null;
  }

  Future<DateTime?> getSelectedDate(BuildContext context) async {
    var currentTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    return currentTime;
  }

  Future<TimeOfDay?> getSelectedTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
     return time;
    }
    return null;
  }

}