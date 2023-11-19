import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/user_stats.dart';

// Provides access to the Firestore database storing User documents.
class UserStatsDatabase {
  UserStatsDatabase(this.ref);

  final ProviderRef<UserStatsDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<UserStats>> watchAllUserStats() => _service.watchCollection(
      path: FirestorePath.allUserStats(),
      builder: (data, documentId) => UserStats.fromJson(data!));

  Stream<UserStats> watchUserStats(String id) => _service.watchDocument(
      path: FirestorePath.userStats(id),
      builder: (data, documentId) => UserStats.fromJson(data!));

  Future<List<UserStats>> fetchAllUserStats() => _service.fetchCollection(
      path: FirestorePath.allUserStats(),
      builder: (data, documentId) => UserStats.fromJson(data!));

  Future<UserStats> fetchUserStats(String id) => _service.fetchDocument(
      path: FirestorePath.userStats(id),
      builder: (data, documentId) => UserStats.fromJson(data!));

  Future<void> setUserStats(UserStats userStats) =>
      _service.setData(path: FirestorePath.userStats(userStats.userId), data: userStats.toJson());
}
