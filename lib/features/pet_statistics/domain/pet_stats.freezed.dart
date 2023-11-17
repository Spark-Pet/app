// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PetStats _$PetStatsFromJson(Map<String, dynamic> json) {
  return _PetStats.fromJson(json);
}

/// @nodoc
mixin _$PetStats {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get hpCurrent => throw _privateConstructorUsedError;
  int get hpTotal => throw _privateConstructorUsedError;
  int get currentLevel => throw _privateConstructorUsedError;
  int get progressNextLevel => throw _privateConstructorUsedError;
  List<String> get equippedAccessoryIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetStatsCopyWith<PetStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetStatsCopyWith<$Res> {
  factory $PetStatsCopyWith(PetStats value, $Res Function(PetStats) then) =
      _$PetStatsCopyWithImpl<$Res, PetStats>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      int hpCurrent,
      int hpTotal,
      int currentLevel,
      int progressNextLevel,
      List<String> equippedAccessoryIds});
}

/// @nodoc
class _$PetStatsCopyWithImpl<$Res, $Val extends PetStats>
    implements $PetStatsCopyWith<$Res> {
  _$PetStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? hpCurrent = null,
    Object? hpTotal = null,
    Object? currentLevel = null,
    Object? progressNextLevel = null,
    Object? equippedAccessoryIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hpCurrent: null == hpCurrent
          ? _value.hpCurrent
          : hpCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      hpTotal: null == hpTotal
          ? _value.hpTotal
          : hpTotal // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      progressNextLevel: null == progressNextLevel
          ? _value.progressNextLevel
          : progressNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      equippedAccessoryIds: null == equippedAccessoryIds
          ? _value.equippedAccessoryIds
          : equippedAccessoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetStatsImplCopyWith<$Res>
    implements $PetStatsCopyWith<$Res> {
  factory _$$PetStatsImplCopyWith(
          _$PetStatsImpl value, $Res Function(_$PetStatsImpl) then) =
      __$$PetStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      int hpCurrent,
      int hpTotal,
      int currentLevel,
      int progressNextLevel,
      List<String> equippedAccessoryIds});
}

/// @nodoc
class __$$PetStatsImplCopyWithImpl<$Res>
    extends _$PetStatsCopyWithImpl<$Res, _$PetStatsImpl>
    implements _$$PetStatsImplCopyWith<$Res> {
  __$$PetStatsImplCopyWithImpl(
      _$PetStatsImpl _value, $Res Function(_$PetStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? hpCurrent = null,
    Object? hpTotal = null,
    Object? currentLevel = null,
    Object? progressNextLevel = null,
    Object? equippedAccessoryIds = null,
  }) {
    return _then(_$PetStatsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hpCurrent: null == hpCurrent
          ? _value.hpCurrent
          : hpCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      hpTotal: null == hpTotal
          ? _value.hpTotal
          : hpTotal // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      progressNextLevel: null == progressNextLevel
          ? _value.progressNextLevel
          : progressNextLevel // ignore: cast_nullable_to_non_nullable
              as int,
      equippedAccessoryIds: null == equippedAccessoryIds
          ? _value._equippedAccessoryIds
          : equippedAccessoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetStatsImpl implements _PetStats {
  const _$PetStatsImpl(
      {required this.id,
      required this.ownerId,
      required this.name,
      required this.hpCurrent,
      required this.hpTotal,
      required this.currentLevel,
      required this.progressNextLevel,
      required final List<String> equippedAccessoryIds})
      : _equippedAccessoryIds = equippedAccessoryIds;

  factory _$PetStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetStatsImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final int hpCurrent;
  @override
  final int hpTotal;
  @override
  final int currentLevel;
  @override
  final int progressNextLevel;
  final List<String> _equippedAccessoryIds;
  @override
  List<String> get equippedAccessoryIds {
    if (_equippedAccessoryIds is EqualUnmodifiableListView)
      return _equippedAccessoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equippedAccessoryIds);
  }

  @override
  String toString() {
    return 'PetStats(id: $id, ownerId: $ownerId, name: $name, hpCurrent: $hpCurrent, hpTotal: $hpTotal, currentLevel: $currentLevel, progressNextLevel: $progressNextLevel, equippedAccessoryIds: $equippedAccessoryIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetStatsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hpCurrent, hpCurrent) ||
                other.hpCurrent == hpCurrent) &&
            (identical(other.hpTotal, hpTotal) || other.hpTotal == hpTotal) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.progressNextLevel, progressNextLevel) ||
                other.progressNextLevel == progressNextLevel) &&
            const DeepCollectionEquality()
                .equals(other._equippedAccessoryIds, _equippedAccessoryIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      name,
      hpCurrent,
      hpTotal,
      currentLevel,
      progressNextLevel,
      const DeepCollectionEquality().hash(_equippedAccessoryIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetStatsImplCopyWith<_$PetStatsImpl> get copyWith =>
      __$$PetStatsImplCopyWithImpl<_$PetStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetStatsImplToJson(
      this,
    );
  }
}

abstract class _PetStats implements PetStats {
  const factory _PetStats(
      {required final String id,
      required final String ownerId,
      required final String name,
      required final int hpCurrent,
      required final int hpTotal,
      required final int currentLevel,
      required final int progressNextLevel,
      required final List<String> equippedAccessoryIds}) = _$PetStatsImpl;

  factory _PetStats.fromJson(Map<String, dynamic> json) =
      _$PetStatsImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get name;
  @override
  int get hpCurrent;
  @override
  int get hpTotal;
  @override
  int get currentLevel;
  @override
  int get progressNextLevel;
  @override
  List<String> get equippedAccessoryIds;
  @override
  @JsonKey(ignore: true)
  _$$PetStatsImplCopyWith<_$PetStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
