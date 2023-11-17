import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenges_data.freezed.dart';
part 'challenges_data.g.dart';

@freezed
class ChallengesData with _$ChallengesData {
  const factory ChallengesData({
    required String id,
    required String name,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required int costEntry,
    required int reward,
    required int requirement,
    @Default(0) required int totalParticipants,
    @Default(0) required int successfulParticipants,
    int? stepGoal,
    double? stepGoalPercentage,
    int? streak,
  }) = _ChallengesData;

  factory ChallengesData.fromJson(Map<String, dynamic> json) => _$ChallengesDataFromJson(json);
}
