import 'package:agenda_app/core/mock_data/mock_data.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'agenda_flow_cubit.freezed.dart';
part 'agenda_flow_state.dart';

@injectable
class AgendaFlowCubit extends Cubit<AgendaFlowState> {
  final MockData mockData;

  AgendaFlowCubit({required this.mockData})
      : super(const AgendaFlowState.loading()) {
    _loadMockData();
  }

  void _loadMockData() async {
    /// show loader for 2 seconds
    await Future.delayed(const Duration(seconds: 1));

    /// fetch mock data
    final agendaList = mockData.getAgendaList();
    agendaList.sort((a, b) => a.date.compareTo(b.date));

    /// find no of tabs
    final map = groupBy(agendaList, (agenda) => agenda.date);
    final tabs = map.keys.indexed
        .map((r) => (id: r.$1 + 1, date: r.$2, dataList: map[r.$2] ?? []))
        .toList();

    emit(AgendaFlowState.loaded(
      tabs: tabs,
      agendaList: agendaList,
    ));
  }

  void addAgenda(AgendaModel agendaModel) {}
}
