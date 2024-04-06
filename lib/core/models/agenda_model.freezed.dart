// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agenda_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AgendaModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeOfDay? get startTime => throw _privateConstructorUsedError;
  TimeOfDay? get endTime => throw _privateConstructorUsedError;
  List<MemberModel> get memberList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AgendaModelCopyWith<AgendaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaModelCopyWith<$Res> {
  factory $AgendaModelCopyWith(
          AgendaModel value, $Res Function(AgendaModel) then) =
      _$AgendaModelCopyWithImpl<$Res, AgendaModel>;
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime date,
      TimeOfDay? startTime,
      TimeOfDay? endTime,
      List<MemberModel> memberList});
}

/// @nodoc
class _$AgendaModelCopyWithImpl<$Res, $Val extends AgendaModel>
    implements $AgendaModelCopyWith<$Res> {
  _$AgendaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? memberList = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      memberList: null == memberList
          ? _value.memberList
          : memberList // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgendaModelImplCopyWith<$Res>
    implements $AgendaModelCopyWith<$Res> {
  factory _$$AgendaModelImplCopyWith(
          _$AgendaModelImpl value, $Res Function(_$AgendaModelImpl) then) =
      __$$AgendaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime date,
      TimeOfDay? startTime,
      TimeOfDay? endTime,
      List<MemberModel> memberList});
}

/// @nodoc
class __$$AgendaModelImplCopyWithImpl<$Res>
    extends _$AgendaModelCopyWithImpl<$Res, _$AgendaModelImpl>
    implements _$$AgendaModelImplCopyWith<$Res> {
  __$$AgendaModelImplCopyWithImpl(
      _$AgendaModelImpl _value, $Res Function(_$AgendaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? memberList = null,
  }) {
    return _then(_$AgendaModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      memberList: null == memberList
          ? _value._memberList
          : memberList // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
    ));
  }
}

/// @nodoc

class _$AgendaModelImpl extends _AgendaModel {
  const _$AgendaModelImpl(
      {this.title = '',
      this.description = '',
      required this.date,
      this.startTime,
      this.endTime,
      final List<MemberModel> memberList = const <MemberModel>[]})
      : _memberList = memberList,
        super._();

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime date;
  @override
  final TimeOfDay? startTime;
  @override
  final TimeOfDay? endTime;
  final List<MemberModel> _memberList;
  @override
  @JsonKey()
  List<MemberModel> get memberList {
    if (_memberList is EqualUnmodifiableListView) return _memberList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberList);
  }

  @override
  String toString() {
    return 'AgendaModel(title: $title, description: $description, date: $date, startTime: $startTime, endTime: $endTime, memberList: $memberList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgendaModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._memberList, _memberList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, date,
      startTime, endTime, const DeepCollectionEquality().hash(_memberList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgendaModelImplCopyWith<_$AgendaModelImpl> get copyWith =>
      __$$AgendaModelImplCopyWithImpl<_$AgendaModelImpl>(this, _$identity);
}

abstract class _AgendaModel extends AgendaModel {
  const factory _AgendaModel(
      {final String title,
      final String description,
      required final DateTime date,
      final TimeOfDay? startTime,
      final TimeOfDay? endTime,
      final List<MemberModel> memberList}) = _$AgendaModelImpl;
  const _AgendaModel._() : super._();

  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  TimeOfDay? get startTime;
  @override
  TimeOfDay? get endTime;
  @override
  List<MemberModel> get memberList;
  @override
  @JsonKey(ignore: true)
  _$$AgendaModelImplCopyWith<_$AgendaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
