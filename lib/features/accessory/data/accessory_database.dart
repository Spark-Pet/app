import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/accessory_data.dart';

// Provides access to the Firestore database storing User documents.
class AccessoryDatabase {
  AccessoryDatabase(this.ref);

  final ProviderRef<AccessoryDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<AccessoryData>> watchAccessories() => _service.watchCollection(
      path: FirestorePath.allAccessoryData(),
      builder: (data, documentId) => AccessoryData.fromJson(data!));

  Stream<AccessoryData> watchAccessory(String id) => _service.watchDocument(
      path: FirestorePath.accessoryData(id),
      builder: (data, documentId) => AccessoryData.fromJson(data!));

  Future<List<AccessoryData>> fetchAccessories() => _service.fetchCollection(
      path: FirestorePath.allAccessoryData(),
      builder: (data, documentId) => AccessoryData.fromJson(data!));

  Future<AccessoryData> fetchAccessory(String id) => _service.fetchDocument(
      path: FirestorePath.accessoryData(id),
      builder: (data, documentId) => AccessoryData.fromJson(data!));

  Future<void> setUser(AccessoryData accessory) =>
      _service.setData(path: FirestorePath.accessoryData(accessory.id), data: accessory.toJson());
}
