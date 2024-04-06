import 'package:agenda_app/core/mock_data/mock_data.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'agenda_create_cubit.freezed.dart';
part 'agenda_create_state.dart';

@injectable
class AgendaCreateCubit extends Cubit<AgendaCreateState> {
  final MockData mockData;

  AgendaCreateCubit({required this.mockData})
      : super(AgendaCreateState(
          selectedMembersList: [],
          membersList: mockData.getMembersList(),
        ));

  void selectMember(MemberModel memberModel) {
    emit(state.copyWith(
        selectedMembersList: [...state.selectedMembersList, memberModel]));
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

  AgendaModel? validateData() {}
}
