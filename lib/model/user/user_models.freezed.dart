// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModels _$UserModelsFromJson(Map<String, dynamic> json) {
  return _UserModels.fromJson(json);
}

/// @nodoc
class _$UserModelsTearOff {
  const _$UserModelsTearOff();

  _UserModels call(
      {String? age,
      String? email,
      String? firstname,
      String? lastname,
      String? profile,
      String? gender,
      String? uid}) {
    return _UserModels(
      age: age,
      email: email,
      firstname: firstname,
      lastname: lastname,
      profile: profile,
      gender: gender,
      uid: uid,
    );
  }

  UserModels fromJson(Map<String, Object?> json) {
    return UserModels.fromJson(json);
  }
}

/// @nodoc
const $UserModels = _$UserModelsTearOff();

/// @nodoc
mixin _$UserModels {
  String? get age => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get profile => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelsCopyWith<UserModels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelsCopyWith<$Res> {
  factory $UserModelsCopyWith(
          UserModels value, $Res Function(UserModels) then) =
      _$UserModelsCopyWithImpl<$Res>;
  $Res call(
      {String? age,
      String? email,
      String? firstname,
      String? lastname,
      String? profile,
      String? gender,
      String? uid});
}

/// @nodoc
class _$UserModelsCopyWithImpl<$Res> implements $UserModelsCopyWith<$Res> {
  _$UserModelsCopyWithImpl(this._value, this._then);

  final UserModels _value;
  // ignore: unused_field
  final $Res Function(UserModels) _then;

  @override
  $Res call({
    Object? age = freezed,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? profile = freezed,
    Object? gender = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserModelsCopyWith<$Res> implements $UserModelsCopyWith<$Res> {
  factory _$UserModelsCopyWith(
          _UserModels value, $Res Function(_UserModels) then) =
      __$UserModelsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? age,
      String? email,
      String? firstname,
      String? lastname,
      String? profile,
      String? gender,
      String? uid});
}

/// @nodoc
class __$UserModelsCopyWithImpl<$Res> extends _$UserModelsCopyWithImpl<$Res>
    implements _$UserModelsCopyWith<$Res> {
  __$UserModelsCopyWithImpl(
      _UserModels _value, $Res Function(_UserModels) _then)
      : super(_value, (v) => _then(v as _UserModels));

  @override
  _UserModels get _value => super._value as _UserModels;

  @override
  $Res call({
    Object? age = freezed,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? profile = freezed,
    Object? gender = freezed,
    Object? uid = freezed,
  }) {
    return _then(_UserModels(
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModels with DiagnosticableTreeMixin implements _UserModels {
  const _$_UserModels(
      {this.age,
      this.email,
      this.firstname,
      this.lastname,
      this.profile,
      this.gender,
      this.uid});

  factory _$_UserModels.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelsFromJson(json);

  @override
  final String? age;
  @override
  final String? email;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? profile;
  @override
  final String? gender;
  @override
  final String? uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModels(age: $age, email: $email, firstname: $firstname, lastname: $lastname, profile: $profile, gender: $gender, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModels'))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('firstname', firstname))
      ..add(DiagnosticsProperty('lastname', lastname))
      ..add(DiagnosticsProperty('profile', profile))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModels &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(profile),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$UserModelsCopyWith<_UserModels> get copyWith =>
      __$UserModelsCopyWithImpl<_UserModels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelsToJson(this);
  }
}

abstract class _UserModels implements UserModels {
  const factory _UserModels(
      {String? age,
      String? email,
      String? firstname,
      String? lastname,
      String? profile,
      String? gender,
      String? uid}) = _$_UserModels;

  factory _UserModels.fromJson(Map<String, dynamic> json) =
      _$_UserModels.fromJson;

  @override
  String? get age;
  @override
  String? get email;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get profile;
  @override
  String? get gender;
  @override
  String? get uid;
  @override
  @JsonKey(ignore: true)
  _$UserModelsCopyWith<_UserModels> get copyWith =>
      throw _privateConstructorUsedError;
}
