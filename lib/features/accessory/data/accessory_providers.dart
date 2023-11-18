import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/accessory_data.dart';
import 'accessory_database.dart';

part 'accessory_providers.g.dart';

@riverpod
AccessoryDatabase accessoryDatabase(AccessoryDatabaseRef ref) {
  return AccessoryDatabase(ref);
}

@riverpod
Stream<List<AccessoryData>> accessories(AccessoriesRef ref) {
  final database = ref.watch(accessoryDatabaseProvider);
  return database.watchAccessories();
}
