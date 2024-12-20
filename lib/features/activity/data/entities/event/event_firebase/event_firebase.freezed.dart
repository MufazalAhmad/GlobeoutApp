// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_firebase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirebaseEventEntity _$FirebaseEventEntityFromJson(Map<String, dynamic> json) {
  return _FirebaseEventEntity.fromJson(json);
}

/// @nodoc
mixin _$FirebaseEventEntity {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<String> get activities => throw _privateConstructorUsedError;
  int get inMinutes => throw _privateConstructorUsedError;
  int get forHours => throw _privateConstructorUsedError;
  bool get forAllFriends => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get updatedTime => throw _privateConstructorUsedError;
  FirebaseUserEntity get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseEventEntityCopyWith<FirebaseEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseEventEntityCopyWith<$Res> {
  factory $FirebaseEventEntityCopyWith(
          FirebaseEventEntity value, $Res Function(FirebaseEventEntity) then) =
      _$FirebaseEventEntityCopyWithImpl<$Res, FirebaseEventEntity>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String userId,
      List<String> activities,
      int inMinutes,
      int forHours,
      bool forAllFriends,
      double lat,
      double lng,
      String updatedTime,
      FirebaseUserEntity user});

  $FirebaseUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$FirebaseEventEntityCopyWithImpl<$Res, $Val extends FirebaseEventEntity>
    implements $FirebaseEventEntityCopyWith<$Res> {
  _$FirebaseEventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? userId = null,
    Object? activities = null,
    Object? inMinutes = null,
    Object? forHours = null,
    Object? forAllFriends = null,
    Object? lat = null,
    Object? lng = null,
    Object? updatedTime = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inMinutes: null == inMinutes
          ? _value.inMinutes
          : inMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      forHours: null == forHours
          ? _value.forHours
          : forHours // ignore: cast_nullable_to_non_nullable
              as int,
      forAllFriends: null == forAllFriends
          ? _value.forAllFriends
          : forAllFriends // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      updatedTime: null == updatedTime
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_FirebaseEventEntityCopyWith<$Res>
    implements $FirebaseEventEntityCopyWith<$Res> {
  factory _$$_FirebaseEventEntityCopyWith(_$_FirebaseEventEntity value,
          $Res Function(_$_FirebaseEventEntity) then) =
      __$$_FirebaseEventEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String userId,
      List<String> activities,
      int inMinutes,
      int forHours,
      bool forAllFriends,
      double lat,
      double lng,
      String updatedTime,
      FirebaseUserEntity user});

  @override
  $FirebaseUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$_FirebaseEventEntityCopyWithImpl<$Res>
    extends _$FirebaseEventEntityCopyWithImpl<$Res, _$_FirebaseEventEntity>
    implements _$$_FirebaseEventEntityCopyWith<$Res> {
  __$$_FirebaseEventEntityCopyWithImpl(_$_FirebaseEventEntity _value,
      $Res Function(_$_FirebaseEventEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? userId = null,
    Object? activities = null,
    Object? inMinutes = null,
    Object? forHours = null,
    Object? forAllFriends = null,
    Object? lat = null,
    Object? lng = null,
    Object? updatedTime = null,
    Object? user = null,
  }) {
    return _then(_$_FirebaseEventEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inMinutes: null == inMinutes
          ? _value.inMinutes
          : inMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      forHours: null == forHours
          ? _value.forHours
          : forHours // ignore: cast_nullable_to_non_nullable
              as int,
      forAllFriends: null == forAllFriends
          ? _value.forAllFriends
          : forAllFriends // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      updatedTime: null == updatedTime
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
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
class _$_FirebaseEventEntity implements _FirebaseEventEntity {
  const _$_FirebaseEventEntity(
      {required this.id,
      required this.createdAt,
      required this.userId,
      required final List<String> activities,
      required this.inMinutes,
      required this.forHours,
      required this.forAllFriends,
      required this.lat,
      required this.lng,
      required this.updatedTime,
      required this.user})
      : _activities = activities;

  factory _$_FirebaseEventEntity.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseEventEntityFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String userId;
  final List<String> _activities;
  @override
  List<String> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  final int inMinutes;
  @override
  final int forHours;
  @override
  final bool forAllFriends;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String updatedTime;
  @override
  final FirebaseUserEntity user;

  @override
  String toString() {
    return 'FirebaseEventEntity(id: $id, createdAt: $createdAt, userId: $userId, activities: $activities, inMinutes: $inMinutes, forHours: $forHours, forAllFriends: $forAllFriends, lat: $lat, lng: $lng, updatedTime: $updatedTime, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseEventEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            (identical(other.inMinutes, inMinutes) ||
                other.inMinutes == inMinutes) &&
            (identical(other.forHours, forHours) ||
                other.forHours == forHours) &&
            (identical(other.forAllFriends, forAllFriends) ||
                other.forAllFriends == forAllFriends) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.updatedTime, updatedTime) ||
                other.updatedTime == updatedTime) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      userId,
      const DeepCollectionEquality().hash(_activities),
      inMinutes,
      forHours,
      forAllFriends,
      lat,
      lng,
      updatedTime,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirebaseEventEntityCopyWith<_$_FirebaseEventEntity> get copyWith =>
      __$$_FirebaseEventEntityCopyWithImpl<_$_FirebaseEventEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseEventEntityToJson(
      this,
    );
  }
}

abstract class _FirebaseEventEntity implements FirebaseEventEntity {
  const factory _FirebaseEventEntity(
      {required final String id,
      required final String createdAt,
      required final String userId,
      required final List<String> activities,
      required final int inMinutes,
      required final int forHours,
      required final bool forAllFriends,
      required final double lat,
      required final double lng,
      required final String updatedTime,
      required final FirebaseUserEntity user}) = _$_FirebaseEventEntity;

  factory _FirebaseEventEntity.fromJson(Map<String, dynamic> json) =
      _$_FirebaseEventEntity.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get userId;
  @override
  List<String> get activities;
  @override
  int get inMinutes;
  @override
  int get forHours;
  @override
  bool get forAllFriends;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get updatedTime;
  @override
  FirebaseUserEntity get user;
  @override
  @JsonKey(ignore: true)
  _$$_FirebaseEventEntityCopyWith<_$_FirebaseEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
