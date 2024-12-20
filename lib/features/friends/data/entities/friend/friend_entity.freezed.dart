// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendEntity _$FriendEntityFromJson(Map<String, dynamic> json) {
  return _FriendEntity.fromJson(json);
}

/// @nodoc
mixin _$FriendEntity {
  String get id => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  bool get requestApproved => throw _privateConstructorUsedError;
  String get requestSentBy => throw _privateConstructorUsedError;
  String get requestSentTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendEntityCopyWith<FriendEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendEntityCopyWith<$Res> {
  factory $FriendEntityCopyWith(
          FriendEntity value, $Res Function(FriendEntity) then) =
      _$FriendEntityCopyWithImpl<$Res, FriendEntity>;
  @useResult
  $Res call(
      {String id,
      List<String> members,
      bool requestApproved,
      String requestSentBy,
      String requestSentTo});
}

/// @nodoc
class _$FriendEntityCopyWithImpl<$Res, $Val extends FriendEntity>
    implements $FriendEntityCopyWith<$Res> {
  _$FriendEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? members = null,
    Object? requestApproved = null,
    Object? requestSentBy = null,
    Object? requestSentTo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requestApproved: null == requestApproved
          ? _value.requestApproved
          : requestApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      requestSentBy: null == requestSentBy
          ? _value.requestSentBy
          : requestSentBy // ignore: cast_nullable_to_non_nullable
              as String,
      requestSentTo: null == requestSentTo
          ? _value.requestSentTo
          : requestSentTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FriendEntityCopyWith<$Res>
    implements $FriendEntityCopyWith<$Res> {
  factory _$$_FriendEntityCopyWith(
          _$_FriendEntity value, $Res Function(_$_FriendEntity) then) =
      __$$_FriendEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> members,
      bool requestApproved,
      String requestSentBy,
      String requestSentTo});
}

/// @nodoc
class __$$_FriendEntityCopyWithImpl<$Res>
    extends _$FriendEntityCopyWithImpl<$Res, _$_FriendEntity>
    implements _$$_FriendEntityCopyWith<$Res> {
  __$$_FriendEntityCopyWithImpl(
      _$_FriendEntity _value, $Res Function(_$_FriendEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? members = null,
    Object? requestApproved = null,
    Object? requestSentBy = null,
    Object? requestSentTo = null,
  }) {
    return _then(_$_FriendEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requestApproved: null == requestApproved
          ? _value.requestApproved
          : requestApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      requestSentBy: null == requestSentBy
          ? _value.requestSentBy
          : requestSentBy // ignore: cast_nullable_to_non_nullable
              as String,
      requestSentTo: null == requestSentTo
          ? _value.requestSentTo
          : requestSentTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FriendEntity implements _FriendEntity {
  const _$_FriendEntity(
      {required this.id,
      required final List<String> members,
      required this.requestApproved,
      required this.requestSentBy,
      required this.requestSentTo})
      : _members = members;

  factory _$_FriendEntity.fromJson(Map<String, dynamic> json) =>
      _$$_FriendEntityFromJson(json);

  @override
  final String id;
  final List<String> _members;
  @override
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final bool requestApproved;
  @override
  final String requestSentBy;
  @override
  final String requestSentTo;

  @override
  String toString() {
    return 'FriendEntity(id: $id, members: $members, requestApproved: $requestApproved, requestSentBy: $requestSentBy, requestSentTo: $requestSentTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FriendEntity &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.requestApproved, requestApproved) ||
                other.requestApproved == requestApproved) &&
            (identical(other.requestSentBy, requestSentBy) ||
                other.requestSentBy == requestSentBy) &&
            (identical(other.requestSentTo, requestSentTo) ||
                other.requestSentTo == requestSentTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_members),
      requestApproved,
      requestSentBy,
      requestSentTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FriendEntityCopyWith<_$_FriendEntity> get copyWith =>
      __$$_FriendEntityCopyWithImpl<_$_FriendEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendEntityToJson(
      this,
    );
  }
}

abstract class _FriendEntity implements FriendEntity {
  const factory _FriendEntity(
      {required final String id,
      required final List<String> members,
      required final bool requestApproved,
      required final String requestSentBy,
      required final String requestSentTo}) = _$_FriendEntity;

  factory _FriendEntity.fromJson(Map<String, dynamic> json) =
      _$_FriendEntity.fromJson;

  @override
  String get id;
  @override
  List<String> get members;
  @override
  bool get requestApproved;
  @override
  String get requestSentBy;
  @override
  String get requestSentTo;
  @override
  @JsonKey(ignore: true)
  _$$_FriendEntityCopyWith<_$_FriendEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
