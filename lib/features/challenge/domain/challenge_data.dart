import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_data.freezed.dart';
part 'challenge_data.g.dart';

@freezed
class ChallengeData with _$ChallengeData {
  const factory ChallengeData({
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

  factory ChallengeData.fromJson(Map<String, dynamic> json) => _$ChallengeDataFromJson(json);
}
