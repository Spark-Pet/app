import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_data.freezed.dart';
part 'challenge_data.g.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => DateTime.parse(timestamp);

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
class ChallengeData with _$ChallengeData {
  const factory ChallengeData({
    required String id,
    required String name,
    required String description,
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializer() required DateTime endDate,
    required int costEntry,
    required int reward,
    @Default(0) int totalParticipants,
    @Default(0) int successfulParticipants,
    int? stepGoal,
    double? stepGoalPercentage,
    int? streak,
  }) = _ChallengesData;

  factory ChallengeData.fromJson(Map<String, dynamic> json) => _$ChallengeDataFromJson(json);
}
