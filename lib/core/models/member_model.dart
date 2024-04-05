import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';

@freezed
class MemberModel with _$MemberModel {
  const factory MemberModel({
    required String name,
    required String photoUrl,
    required DateTime dob,
  }) = _MemberModel;
}
