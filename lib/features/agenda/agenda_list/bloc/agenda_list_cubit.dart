import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'agenda_list_cubit.freezed.dart';
part 'agenda_list_state.dart';

@injectable
class AgendaListCubit extends Cubit<AgendaListState> {
  AgendaListCubit() : super(const AgendaListState());

  void createAgenda() {}
}
