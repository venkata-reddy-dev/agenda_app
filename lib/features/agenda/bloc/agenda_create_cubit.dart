import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/extentions/time_of_day_x.dart';
import 'package:agenda_app/core/mock_data/mock_data.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'agenda_create_cubit.freezed.dart';
part 'agenda_create_state.dart';

@injectable
class AgendaCreateCubit extends Cubit<AgendaCreateState> {
  final MockData mockData;

  AgendaCreateCubit({required this.mockData})
      : super(
          AgendaCreateState(
            date: DateTime.now().removeHMS,
            selectedMembersList: [],
            membersList: mockData.getMembersList(),
            startTime: TimeOfDay.now().moveToNextHour,
            endTime: TimeOfDay.now().moveToNextHour.moveToNextHour,
          ),
        );

  void startFresh() {
    final state = AgendaCreateState(
      date: DateTime.now().removeHMS,
      selectedMembersList: [],
      membersList: mockData.getMembersList(),
      startTime: TimeOfDay.now().moveToNextHour,
      endTime: TimeOfDay.now().moveToNextHour.moveToNextHour,
    );
    emit(state);
  }

  void selectMember(MemberModel memberModel) {
    emit(state.copyWith(
      selectedMembersList: [...state.selectedMembersList, memberModel],
      selectedMembersErrorMsg: null,
    ));
  }

  void unSelectMember(MemberModel memberModel) {
    final selectedMembersList = [...state.selectedMembersList]
      ..remove(memberModel);
    emit(state.copyWith(selectedMembersList: selectedMembersList));
  }

  void updateTitle(String title) {
    emit(state.copyWith(title: title, titleErrorMsg: null));
  }

  void updateDesc(String desc) {
    emit(state.copyWith(desc: desc, descErrorMsg: null));
  }

  void updateDate(DateTime date) {
    emit(state.copyWith(date: date.removeHMS));
  }

  void updateStartTime(TimeOfDay timeOfDay) {
    emit(state.copyWith(
      startTime: timeOfDay,
      endTime: timeOfDay.moveToNextHour,
      timeErrorMsg: null,
    ));
  }

  void updateEndTime(TimeOfDay timeOfDay) {
    emit(state.copyWith(
      endTime: timeOfDay,
      timeErrorMsg: null,
    ));
  }

  AgendaModel? validateData() {
    var errorState = state.copyWith(
        timeErrorMsg: state.title.isEmpty ? 'Title should not be empty' : null);

    String? timeErrorMsg;
    if (state.startTime.hour > state.endTime.hour) {
      timeErrorMsg = 'Start time should be less than End time';
    } else if (state.startTime.hour == state.endTime.hour &&
        state.startTime.minute > state.endTime.minute) {
      timeErrorMsg = 'Start time should be less than End time';
    }

    errorState = state.copyWith(timeErrorMsg: timeErrorMsg);

    errorState = state.copyWith(
        selectedMembersErrorMsg: state.selectedMembersList.isEmpty
            ? 'Select at least 1 Speaker'
            : null);

    errorState = state.copyWith(
        descErrorMsg:
            state.desc.isEmpty ? 'Description should not be empty' : null);
    emit(errorState);

    if (!errorState.isValid) {
      return null;
    }

    return AgendaModel(
      date: state.date,
      title: state.title,
      startTime: state.startTime,
      endTime: state.endTime,
      memberList: state.selectedMembersList,
      description: state.desc,
    );
  }
}
