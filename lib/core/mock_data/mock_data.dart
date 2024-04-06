import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mock_data/mock_data.dart';

@lazySingleton
class MockData {
  List<AgendaModel> getAgendaList() {
    return [
      _getAgendaData(daysDiff: 0, hourDiff: -1),
      _getAgendaData(daysDiff: 0, hourDiff: 0),
      _getAgendaData(daysDiff: 0, hourDiff: 1),
      _getAgendaData(daysDiff: 0, hourDiff: 2),
      _getAgendaData(daysDiff: 0, hourDiff: 3),
      _getAgendaData(daysDiff: 1, hourDiff: 0),
      _getAgendaData(daysDiff: 1, hourDiff: 1),
      _getAgendaData(daysDiff: 1, hourDiff: 2),
      _getAgendaData(daysDiff: 2, hourDiff: 0),
      _getAgendaData(daysDiff: 2, hourDiff: 1),
      _getAgendaData(daysDiff: 2, hourDiff: 2),
      _getAgendaData(daysDiff: 4, hourDiff: 0),
      _getAgendaData(daysDiff: 4, hourDiff: 1),
      _getAgendaData(daysDiff: 4, hourDiff: 2),
    ];
  }

  AgendaModel _getAgendaData({
    required int daysDiff,
    required int hourDiff,
  }) {
    final date = DateTime.now().addYMD(d: daysDiff).removeHMS;
    final timeOfToday = TimeOfDay.now();
    final timeOfDay = TimeOfDay(
      hour: timeOfToday.hour + hourDiff,
      minute: timeOfToday.minute,
    );
    return AgendaModel(
      date: date,
      title: 'Title is ${mockName()}',
      description: 'Description is ${mockName()}',
      startTime: timeOfDay,
      endTime: TimeOfDay(
        hour: timeOfDay.hour + 1,
        minute: timeOfDay.minute,
      ),
      memberList: [
        _getMemberData(1),
        _getMemberData(2),
        _getMemberData(3),
        _getMemberData(4),
        _getMemberData(5),
        _getMemberData(6),
      ],
    );
  }

  MemberModel _getMemberData(int imageId) {
    return MemberModel(
      name: mockName(),
      photoUrl: 'https://i.pravatar.cc/150?img=$imageId',
      dob: DateTime(
        mockInteger(1990, 2000),
        mockInteger(1, 12),
        mockInteger(1, 28),
      ),
    );
  }
}
