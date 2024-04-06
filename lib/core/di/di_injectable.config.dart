// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:agenda_app/core/mock_data/mock_data.dart' as _i4;
import 'package:agenda_app/features/agenda/agenda_list/bloc/agenda_list_cubit.dart'
    as _i3;
import 'package:agenda_app/features/agenda/bloc/agenda_flow_cubit.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AgendaListCubit>(() => _i3.AgendaListCubit());
    gh.lazySingleton<_i4.MockData>(() => _i4.MockData());
    gh.factory<_i5.AgendaFlowCubit>(
        () => _i5.AgendaFlowCubit(mockData: gh<_i4.MockData>()));
    return this;
  }
}
