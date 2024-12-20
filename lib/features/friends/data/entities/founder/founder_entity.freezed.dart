// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'founder_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FounderEntity _$FounderEntityFromJson(Map<String, dynamic> json) {
  return _FounderEntity.fromJson(json);
}

/// @nodoc
mixin _$FounderEntity {
  String get id => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  List<String> get followers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FounderEntityCopyWith<FounderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FounderEntityCopyWith<$Res> {
  factory $FounderEntityCopyWith(
          FounderEntity value, $Res Function(FounderEntity) then) =
      _$FounderEntityCopyWithImpl<$Res, FounderEntity>;
  @useResult
  $Res call({String id, String imgUrl, List<String> followers});
}

/// @nodoc
class _$FounderEntityCopyWithImpl<$Res, $Val extends FounderEntity>
    implements $FounderEntityCopyWith<$Res> {
  _$FounderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgUrl = null,
    Object? followers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FounderEntityCopyWith<$Res>
    implements $FounderEntityCopyWith<$Res> {
  factory _$$_FounderEntityCopyWith(
          _$_FounderEntity value, $Res Function(_$_FounderEntity) then) =
      __$$_FounderEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String imgUrl, List<String> followers});
}

/// @nodoc
class __$$_FounderEntityCopyWithImpl<$Res>
    extends _$FounderEntityCopyWithImpl<$Res, _$_FounderEntity>
    implements _$$_FounderEntityCopyWith<$Res> {
  __$$_FounderEntityCopyWithImpl(
      _$_FounderEntity _value, $Res Function(_$_FounderEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imgUrl = null,
    Object? followers = null,
  }) {
    return _then(_$_FounderEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FounderEntity implements _FounderEntity {
  const _$_FounderEntity(
      {required this.id,
      required this.imgUrl,
      required final List<String> followers})
      : _followers = followers;

  factory _$_FounderEntity.fromJson(Map<String, dynamic> json) =>
      _$$_FounderEntityFromJson(json);

  @override
  final String id;
  @override
  final String imgUrl;
  final List<String> _followers;
  @override
  List<String> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  @override
  String toString() {
    return 'FounderEntity(id: $id, imgUrl: $imgUrl, followers: $followers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FounderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, imgUrl, const DeepCollectionEquality().hash(_followers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FounderEntityCopyWith<_$_FounderEntity> get copyWith =>
      __$$_FounderEntityCopyWithImpl<_$_FounderEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FounderEntityToJson(
      this,
    );
  }
}

abstract class _FounderEntity implements FounderEntity {
  const factory _FounderEntity(
      {required final String id,
      required final String imgUrl,
      required final List<String> followers}) = _$_FounderEntity;

  factory _FounderEntity.fromJson(Map<String, dynamic> json) =
      _$_FounderEntity.fromJson;

  @override
  String get id;
  @override
  String get imgUrl;
  @override
  List<String> get followers;
  @override
  @JsonKey(ignore: true)
  _$$_FounderEntityCopyWith<_$_FounderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
