import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_stats.freezed.dart';
part 'pet_stats.g.dart';

@freezed
class PetStats with _$PetStats {
  const factory PetStats({
    required String id,
    required String ownerId,
    required String name,
    required int hpCurrent,
    required int hpTotal,
    required int currentLevel,
    required int progressNextLevel,
    required List<String> equippedAccessoryIds,
  }) = _PetStats;

  factory PetStats.fromJson(Map<String, dynamic> json) => _$PetStatsFromJson(json);
}
