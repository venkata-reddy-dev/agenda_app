part of 'agenda_flow_cubit.dart';

@freezed
class AgendaFlowState with _$AgendaFlowState {
  const factory AgendaFlowState.loaded({
    required List<({int id, DateTime date, List<AgendaModel> dataList})> tabs,
    required List<AgendaModel> agendaList,
  }) = Loaded;
  const factory AgendaFlowState.loading() = Loading;
}
