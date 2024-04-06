// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agenda_create_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AgendaCreateState {
  List<MemberModel> get selectedMembersList =>
      throw _privateConstructorUsedError;
  List<MemberModel> get membersList => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get titleErrorMsg => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String? get descErrorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AgendaCreateStateCopyWith<AgendaCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaCreateStateCopyWith<$Res> {
  factory $AgendaCreateStateCopyWith(
          AgendaCreateState value, $Res Function(AgendaCreateState) then) =
      _$AgendaCreateStateCopyWithImpl<$Res, AgendaCreateState>;
  @useResult
  $Res call(
      {List<MemberModel> selectedMembersList,
      List<MemberModel> membersList,
      String title,
      String? titleErrorMsg,
      String desc,
      String? descErrorMsg});
}

/// @nodoc
class _$AgendaCreateStateCopyWithImpl<$Res, $Val extends AgendaCreateState>
    implements $AgendaCreateStateCopyWith<$Res> {
  _$AgendaCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMembersList = null,
    Object? membersList = null,
    Object? title = null,
    Object? titleErrorMsg = freezed,
    Object? desc = null,
    Object? descErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      selectedMembersList: null == selectedMembersList
          ? _value.selectedMembersList
          : selectedMembersList // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      membersList: null == membersList
          ? _value.membersList
          : membersList // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleErrorMsg: freezed == titleErrorMsg
          ? _value.titleErrorMsg
          : titleErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      descErrorMsg: freezed == descErrorMsg
          ? _value.descErrorMsg
          : descErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AgendaCreateStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MemberModel> selectedMembersList,
      List<MemberModel> membersList,
      String title,
      String? titleErrorMsg,
      String desc,
      String? descErrorMsg});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AgendaCreateStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMembersList = null,
    Object? membersList = null,
    Object? title = null,
    Object? titleErrorMsg = freezed,
    Object? desc = null,
    Object? descErrorMsg = freezed,
  }) {
    return _then(_$InitialImpl(
      selectedMembersList: null == selectedMembersList
          ? _value._selectedMembersList
          : selectedMembersList // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      membersList: null == membersList
          ? _value._membersList
          : membersList // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleErrorMsg: freezed == titleErrorMsg
          ? _value.titleErrorMsg
          : titleErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      descErrorMsg: freezed == descErrorMsg
          ? _value.descErrorMsg
          : descErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<MemberModel> selectedMembersList,
      required final List<MemberModel> membersList,
      this.title = '',
      this.titleErrorMsg,
      this.desc = '',
      this.descErrorMsg})
      : _selectedMembersList = selectedMembersList,
        _membersList = membersList;

  final List<MemberModel> _selectedMembersList;
  @override
  List<MemberModel> get selectedMembersList {
    if (_selectedMembersList is EqualUnmodifiableListView)
      return _selectedMembersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedMembersList);
  }

  final List<MemberModel> _membersList;
  @override
  List<MemberModel> get membersList {
    if (_membersList is EqualUnmodifiableListView) return _membersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membersList);
  }

  @override
  @JsonKey()
  final String title;
  @override
  final String? titleErrorMsg;
  @override
  @JsonKey()
  final String desc;
  @override
  final String? descErrorMsg;

  @override
  String toString() {
    return 'AgendaCreateState(selectedMembersList: $selectedMembersList, membersList: $membersList, title: $title, titleErrorMsg: $titleErrorMsg, desc: $desc, descErrorMsg: $descErrorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedMembersList, _selectedMembersList) &&
            const DeepCollectionEquality()
                .equals(other._membersList, _membersList) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleErrorMsg, titleErrorMsg) ||
                other.titleErrorMsg == titleErrorMsg) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.descErrorMsg, descErrorMsg) ||
                other.descErrorMsg == descErrorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedMembersList),
      const DeepCollectionEquality().hash(_membersList),
      title,
      titleErrorMsg,
      desc,
      descErrorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AgendaCreateState {
  const factory _Initial(
      {required final List<MemberModel> selectedMembersList,
      required final List<MemberModel> membersList,
      final String title,
      final String? titleErrorMsg,
      final String desc,
      final String? descErrorMsg}) = _$InitialImpl;

  @override
  List<MemberModel> get selectedMembersList;
  @override
  List<MemberModel> get membersList;
  @override
  String get title;
  @override
  String? get titleErrorMsg;
  @override
  String get desc;
  @override
  String? get descErrorMsg;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
