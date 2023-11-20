// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengesDataImpl _$$ChallengesDataImplFromJson(Map<String, dynamic> json) =>
    _$ChallengesDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      startDate: const TimestampSerializer().fromJson(json['startDate']),
      endDate: const TimestampSerializer().fromJson(json['endDate']),
      costEntry: json['costEntry'] as int,
      reward: json['reward'] as int,
      totalParticipants: json['totalParticipants'] as int? ?? 0,
      successfulParticipants: json['successfulParticipants'] as int? ?? 0,
      stepGoal: json['stepGoal'] as int?,
      stepGoalPercentage: (json['stepGoalPercentage'] as num?)?.toDouble(),
      streak: json['streak'] as int?,
    );

Map<String, dynamic> _$$ChallengesDataImplToJson(
        _$ChallengesDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      'costEntry': instance.costEntry,
      'reward': instance.reward,
      'totalParticipants': instance.totalParticipants,
      'successfulParticipants': instance.successfulParticipants,
      'stepGoal': instance.stepGoal,
      'stepGoalPercentage': instance.stepGoalPercentage,
      'streak': instance.streak,
    };
