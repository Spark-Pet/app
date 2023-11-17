import 'package:freezed_annotation/freezed_annotation.dart';

part 'accessory_data.freezed.dart';
part 'accessory_data.g.dart';

@freezed
class AccessoryData with _$AccessoryData {
  const factory AccessoryData({
    required String id,
    required String name,
    required String imagePath,
    required int price,
    required String type,
  }) = _AccessoryData;

  factory AccessoryData.fromJson(Map<String, dynamic> json) => _$AccessoryDataFromJson(json);
}
