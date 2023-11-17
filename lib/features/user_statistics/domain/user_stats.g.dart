// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatsImpl _$$UserStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatsImpl(
      userId: json['userId'] as String,
      steps: (json['steps'] as List<dynamic>).map((e) => e as int).toList(),
      dailyStepsGoal: json['dailyStepsGoal'] as int,
      currentStreakDays: json['currentStreakDays'] as int,
    );

Map<String, dynamic> _$$UserStatsImplToJson(_$UserStatsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'steps': instance.steps,
      'dailyStepsGoal': instance.dailyStepsGoal,
      'currentStreakDays': instance.currentStreakDays,
    };
