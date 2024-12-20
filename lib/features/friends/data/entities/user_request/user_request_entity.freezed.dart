// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRequestEntity _$UserRequestEntityFromJson(Map<String, dynamic> json) {
  return _UserRequestEntity.fromJson(json);
}

/// @nodoc
mixin _$UserRequestEntity {
  String get id => throw _privateConstructorUsedError;
  FirebaseUserEntity get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestEntityCopyWith<UserRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestEntityCopyWith<$Res> {
  factory $UserRequestEntityCopyWith(
          UserRequestEntity value, $Res Function(UserRequestEntity) then) =
      _$UserRequestEntityCopyWithImpl<$Res, UserRequestEntity>;
  @useResult
  $Res call({String id, FirebaseUserEntity user});

  $FirebaseUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$UserRequestEntityCopyWithImpl<$Res, $Val extends UserRequestEntity>
    implements $UserRequestEntityCopyWith<$Res> {
  _$UserRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FirebaseUserEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FirebaseUserEntityCopyWith<$Res> get user {
    return $FirebaseUserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserRequestEntityCopyWith<$Res>
    implements $UserRequestEntityCopyWith<$Res> {
  factory _$$_UserRequestEntityCopyWith(_$_UserRequestEntity value,
          $Res Function(_$_UserRequestEntity) then) =
      __$$_UserRequestEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, FirebaseUserEntity user});

  @override
  $FirebaseUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserRequestEntityCopyWithImpl<$Res>
    extends _$UserRequestEntityCopyWithImpl<$Res, _$_UserRequestEntity>
    implements _$$_UserRequestEntityCopyWith<$Res> {
  __$$_UserRequestEntityCopyWithImpl(
      _$_UserRequestEntity _value, $Res Function(_$_UserRequestEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
  }) {
    return _then(_$_UserRequestEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FirebaseUserEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRequestEntity implements _UserRequestEntity {
  const _$_UserRequestEntity({required this.id, required this.user});

  factory _$_UserRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserRequestEntityFromJson(json);

  @override
  final String id;
  @override
  final FirebaseUserEntity user;

  @override
  String toString() {
    return 'UserRequestEntity(id: $id, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRequestEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRequestEntityCopyWith<_$_UserRequestEntity> get copyWith =>
      __$$_UserRequestEntityCopyWithImpl<_$_UserRequestEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRequestEntityToJson(
      this,
    );
  }
}

abstract class _UserRequestEntity implements UserRequestEntity {
  const factory _UserRequestEntity(
      {required final String id,
      required final FirebaseUserEntity user}) = _$_UserRequestEntity;

  factory _UserRequestEntity.fromJson(Map<String, dynamic> json) =
      _$_UserRequestEntity.fromJson;

  @override
  String get id;
  @override
  FirebaseUserEntity get user;
  @override
  @JsonKey(ignore: true)
  _$$_UserRequestEntityCopyWith<_$_UserRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
