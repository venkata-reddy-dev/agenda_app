import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'member_model.dart';

part 'agenda_model.freezed.dart';

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
}
