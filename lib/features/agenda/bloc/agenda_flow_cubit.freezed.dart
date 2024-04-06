// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agenda_flow_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AgendaFlowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)
        loaded,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)?
        loaded,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)?
        loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaFlowStateCopyWith<$Res> {
  factory $AgendaFlowStateCopyWith(
          AgendaFlowState value, $Res Function(AgendaFlowState) then) =
      _$AgendaFlowStateCopyWithImpl<$Res, AgendaFlowState>;
}

/// @nodoc
class _$AgendaFlowStateCopyWithImpl<$Res, $Val extends AgendaFlowState>
    implements $AgendaFlowStateCopyWith<$Res> {
  _$AgendaFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
      List<AgendaModel> agendaList});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AgendaFlowStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? agendaList = null,
  }) {
    return _then(_$LoadedImpl(
      tabs: null == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<({List<AgendaModel> dataList, DateTime date, int id})>,
      agendaList: null == agendaList
          ? _value._agendaList
          : agendaList // ignore: cast_nullable_to_non_nullable
              as List<AgendaModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(
      {required final List<
              ({List<AgendaModel> dataList, DateTime date, int id})>
          tabs,
      required final List<AgendaModel> agendaList})
      : _tabs = tabs,
        _agendaList = agendaList;

  final List<({List<AgendaModel> dataList, DateTime date, int id})> _tabs;
  @override
  List<({List<AgendaModel> dataList, DateTime date, int id})> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  final List<AgendaModel> _agendaList;
  @override
  List<AgendaModel> get agendaList {
    if (_agendaList is EqualUnmodifiableListView) return _agendaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_agendaList);
  }

  @override
  String toString() {
    return 'AgendaFlowState.loaded(tabs: $tabs, agendaList: $agendaList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            const DeepCollectionEquality()
                .equals(other._agendaList, _agendaList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tabs),
      const DeepCollectionEquality().hash(_agendaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)
        loaded,
    required TResult Function() loading,
  }) {
    return loaded(tabs, agendaList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)?
        loaded,
    TResult? Function()? loading,
  }) {
    return loaded?.call(tabs, agendaList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)?
        loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tabs, agendaList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements AgendaFlowState {
  const factory Loaded(
      {required final List<
              ({List<AgendaModel> dataList, DateTime date, int id})>
          tabs,
      required final List<AgendaModel> agendaList}) = _$LoadedImpl;

  List<({List<AgendaModel> dataList, DateTime date, int id})> get tabs;
  List<AgendaModel> get agendaList;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AgendaFlowStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AgendaFlowState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)
        loaded,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)?
        loaded,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<({List<AgendaModel> dataList, DateTime date, int id})> tabs,
            List<AgendaModel> agendaList)?
        loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AgendaFlowState {
  const factory Loading() = _$LoadingImpl;
}
