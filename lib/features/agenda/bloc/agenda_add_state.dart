part of 'agenda_add_cubit.dart';

@freezed
class AgendaAddState with _$AgendaAddState {
  const factory AgendaAddState({
    required List<MemberModel> membersList,
    required List<MemberModel> selectedMembersList,
    String? selectedMembersErrorMsg,
    @Default('') String title,
    String? titleErrorMsg,
    @Default('') String desc,
    String? descErrorMsg,
    required DateTime date,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    String? timeErrorMsg,
  }) = _Initial;

  const AgendaAddState._();

  bool get isValid {
    return !(titleErrorMsg != null ||
        selectedMembersErrorMsg != null ||
        titleErrorMsg != null ||
        descErrorMsg != null);
  }
}
