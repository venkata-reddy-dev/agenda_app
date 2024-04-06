part of 'agenda_create_cubit.dart';

@freezed
class AgendaCreateState with _$AgendaCreateState {
  const factory AgendaCreateState({
    required List<MemberModel> selectedMembersList,
    required List<MemberModel> membersList,
    @Default('') String title,
    String? titleErrorMsg,
    @Default('') String desc,
    String? descErrorMsg,
  }) = _Initial;
}
