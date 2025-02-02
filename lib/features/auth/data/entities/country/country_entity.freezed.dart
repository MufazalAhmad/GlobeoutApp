// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryEntity _$CountryEntityFromJson(Map<String, dynamic> json) {
  return _CountryEntity.fromJson(json);
}

/// @nodoc
mixin _$CountryEntity {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryEntityCopyWith<CountryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryEntityCopyWith<$Res> {
  factory $CountryEntityCopyWith(
          CountryEntity value, $Res Function(CountryEntity) then) =
      _$CountryEntityCopyWithImpl<$Res, CountryEntity>;
  @useResult
  $Res call({String name, String code, String flag});
}

/// @nodoc
class _$CountryEntityCopyWithImpl<$Res, $Val extends CountryEntity>
    implements $CountryEntityCopyWith<$Res> {
  _$CountryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? flag = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryEntityCopyWith<$Res>
    implements $CountryEntityCopyWith<$Res> {
  factory _$$_CountryEntityCopyWith(
          _$_CountryEntity value, $Res Function(_$_CountryEntity) then) =
      __$$_CountryEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code, String flag});
}

/// @nodoc
class __$$_CountryEntityCopyWithImpl<$Res>
    extends _$CountryEntityCopyWithImpl<$Res, _$_CountryEntity>
    implements _$$_CountryEntityCopyWith<$Res> {
  __$$_CountryEntityCopyWithImpl(
      _$_CountryEntity _value, $Res Function(_$_CountryEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? flag = null,
  }) {
    return _then(_$_CountryEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryEntity implements _CountryEntity {
  const _$_CountryEntity(
      {required this.name, required this.code, required this.flag});

  factory _$_CountryEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CountryEntityFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String flag;

  @override
  String toString() {
    return 'CountryEntity(name: $name, code: $code, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryEntityCopyWith<_$_CountryEntity> get copyWith =>
      __$$_CountryEntityCopyWithImpl<_$_CountryEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryEntityToJson(
      this,
    );
  }
}

abstract class _CountryEntity implements CountryEntity {
  const factory _CountryEntity(
      {required final String name,
      required final String code,
      required final String flag}) = _$_CountryEntity;

  factory _CountryEntity.fromJson(Map<String, dynamic> json) =
      _$_CountryEntity.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get flag;
  @override
  @JsonKey(ignore: true)
  _$$_CountryEntityCopyWith<_$_CountryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
