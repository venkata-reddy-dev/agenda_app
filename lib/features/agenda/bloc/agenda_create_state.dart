part of 'agenda_create_cubit.dart';

@freezed
class AgendaCreateState with _$AgendaCreateState {
  const factory AgendaCreateState({
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

  const AgendaCreateState._();

  bool get isValid {
    return !(titleErrorMsg != null ||
        selectedMembersErrorMsg != null ||
        titleErrorMsg != null ||
        descErrorMsg != null);
  }
}
