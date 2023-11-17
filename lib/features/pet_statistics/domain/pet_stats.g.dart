// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetStatsImpl _$$PetStatsImplFromJson(Map<String, dynamic> json) =>
    _$PetStatsImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      hpCurrent: json['hpCurrent'] as int,
      hpTotal: json['hpTotal'] as int,
      currentLevel: json['currentLevel'] as int,
      progressNextLevel: json['progressNextLevel'] as int,
      equippedAccessoryIds: (json['equippedAccessoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PetStatsImplToJson(_$PetStatsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'hpCurrent': instance.hpCurrent,
      'hpTotal': instance.hpTotal,
      'currentLevel': instance.currentLevel,
      'progressNextLevel': instance.progressNextLevel,
      'equippedAccessoryIds': instance.equippedAccessoryIds,
    };
