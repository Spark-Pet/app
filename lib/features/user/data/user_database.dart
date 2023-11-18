import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/user_data.dart';

// Provides access to the Firestore database storing User documents.
class UserDatabase {
  UserDatabase(this.ref);

  final ProviderRef<UserDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<UserData>> watchUsers() => _service.watchCollection(
      path: FirestorePath.allUserData(),
      builder: (data, documentId) => UserData.fromJson(data!));

  Stream<UserData> watchUser(String id) => _service.watchDocument(
      path: FirestorePath.userData(id),
      builder: (data, documentId) => UserData.fromJson(data!));

  Future<List<UserData>> fetchUsers() => _service.fetchCollection(
      path: FirestorePath.allUserData(),
      builder: (data, documentId) => UserData.fromJson(data!));

  Future<UserData> fetchUser(String id) => _service.fetchDocument(
      path: FirestorePath.userData(id),
      builder: (data, documentId) => UserData.fromJson(data!));

  Future<void> setUser(UserData user) =>
      _service.setData(path: FirestorePath.userData(user.id), data: user.toJson());
}
