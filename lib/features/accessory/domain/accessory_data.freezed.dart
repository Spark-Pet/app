// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accessory_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessoryData _$AccessoryDataFromJson(Map<String, dynamic> json) {
  return _AccessoryData.fromJson(json);
}

/// @nodoc
mixin _$AccessoryData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessoryDataCopyWith<AccessoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessoryDataCopyWith<$Res> {
  factory $AccessoryDataCopyWith(
          AccessoryData value, $Res Function(AccessoryData) then) =
      _$AccessoryDataCopyWithImpl<$Res, AccessoryData>;
  @useResult
  $Res call({String id, String name, String imagePath, int price, String type});
}

/// @nodoc
class _$AccessoryDataCopyWithImpl<$Res, $Val extends AccessoryData>
    implements $AccessoryDataCopyWith<$Res> {
  _$AccessoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? price = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessoryDataImplCopyWith<$Res>
    implements $AccessoryDataCopyWith<$Res> {
  factory _$$AccessoryDataImplCopyWith(
          _$AccessoryDataImpl value, $Res Function(_$AccessoryDataImpl) then) =
      __$$AccessoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String imagePath, int price, String type});
}

/// @nodoc
class __$$AccessoryDataImplCopyWithImpl<$Res>
    extends _$AccessoryDataCopyWithImpl<$Res, _$AccessoryDataImpl>
    implements _$$AccessoryDataImplCopyWith<$Res> {
  __$$AccessoryDataImplCopyWithImpl(
      _$AccessoryDataImpl _value, $Res Function(_$AccessoryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? price = null,
    Object? type = null,
  }) {
    return _then(_$AccessoryDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessoryDataImpl implements _AccessoryData {
  const _$AccessoryDataImpl(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.price,
      required this.type});

  factory _$AccessoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessoryDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imagePath;
  @override
  final int price;
  @override
  final String type;

  @override
  String toString() {
    return 'AccessoryData(id: $id, name: $name, imagePath: $imagePath, price: $price, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessoryDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imagePath, price, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessoryDataImplCopyWith<_$AccessoryDataImpl> get copyWith =>
      __$$AccessoryDataImplCopyWithImpl<_$AccessoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessoryDataImplToJson(
      this,
    );
  }
}

abstract class _AccessoryData implements AccessoryData {
  const factory _AccessoryData(
      {required final String id,
      required final String name,
      required final String imagePath,
      required final int price,
      required final String type}) = _$AccessoryDataImpl;

  factory _AccessoryData.fromJson(Map<String, dynamic> json) =
      _$AccessoryDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imagePath;
  @override
  int get price;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$AccessoryDataImplCopyWith<_$AccessoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
