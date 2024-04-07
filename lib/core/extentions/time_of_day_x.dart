import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  TimeOfDay get trimMinutes => TimeOfDay(hour: hour, minute: 0);
  TimeOfDay get moveToNextHour =>
      TimeOfDay(hour: hour == 23 ? hour : hour + 1, minute: 0);
}
