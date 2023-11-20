import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
    required String email,
    required String username,
    required String petId,
    required String statsId,
    required int bones,
    required List<String> purchasedAccessoryIds,
    required List<String> activeChallengeIds,
    required List<String> pastChallengeIds,
    required DateTime dateJoined,
    String? imagePath,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  // Test that the json file can be converted into entities
  static Future<List<UserData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/userData.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => UserData.fromJson(jsonData)).toList();
  }
}
