import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'member_model.dart';

part 'agenda_model.freezed.dart';

enum AgendaStatus { done, inProgress, upcoming }

@freezed
class AgendaModel with _$AgendaModel {
  const factory AgendaModel({
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    @Default(<MemberModel>[]) List<MemberModel> memberList,
  }) = _AgendaModel;

  const AgendaModel._();

  AgendaStatus get status {
    final today = DateTime.now();
    final agendaStartDateTime =
        date.copyWith(hour: startTime?.hour, minute: startTime?.minute);
    final agendaEndDateTime =
        date.copyWith(hour: endTime?.hour, minute: endTime?.minute);

    if (today.isAfter(agendaStartDateTime) &&
        today.isBefore(agendaEndDateTime)) {
      return AgendaStatus.inProgress;
    } else if (today.isAfter(agendaStartDateTime)) {
      return AgendaStatus.done;
    } else {
      return AgendaStatus.upcoming;
    }
  }
}
