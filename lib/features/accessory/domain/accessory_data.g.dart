// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessory_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessoryDataImpl _$$AccessoryDataImplFromJson(Map<String, dynamic> json) =>
    _$AccessoryDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      price: json['price'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$AccessoryDataImplToJson(_$AccessoryDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'price': instance.price,
      'type': instance.type,
    };
