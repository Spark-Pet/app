// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      username: json['username'] as String,
      petId: json['petId'] as String,
      statsId: json['statsId'] as String,
      bones: json['bones'] as int,
      purchasedAccessoryIds: (json['purchasedAccessoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      activeChallengeIds: (json['activeChallengeIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pastChallengeIds: (json['pastChallengeIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      dateJoined: DateTime.parse(json['dateJoined'] as String),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'petId': instance.petId,
      'statsId': instance.statsId,
      'bones': instance.bones,
      'purchasedAccessoryIds': instance.purchasedAccessoryIds,
      'activeChallengeIds': instance.activeChallengeIds,
      'pastChallengeIds': instance.pastChallengeIds,
      'dateJoined': instance.dateJoined.toIso8601String(),
      'imagePath': instance.imagePath,
    };
