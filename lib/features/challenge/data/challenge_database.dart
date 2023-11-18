import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/challenge_data.dart';

// Provides access to the Firestore database storing User documents.
class ChallengeDatabase {
  ChallengeDatabase(this.ref);

  final ProviderRef<ChallengeDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<ChallengeData>> watchChallenges() => _service.watchCollection(
      path: FirestorePath.allChallengeData(),
      builder: (data, documentId) => ChallengeData.fromJson(data!));

  Stream<ChallengeData> watchChallenge(String id) => _service.watchDocument(
      path: FirestorePath.challengeData(id),
      builder: (data, documentId) => ChallengeData.fromJson(data!));

  Future<List<ChallengeData>> fetchChallenges() => _service.fetchCollection(
      path: FirestorePath.allChallengeData(),
      builder: (data, documentId) => ChallengeData.fromJson(data!));

  Future<ChallengeData> fetchChallenge(String id) => _service.fetchDocument(
      path: FirestorePath.challengeData(id),
      builder: (data, documentId) => ChallengeData.fromJson(data!));

  Future<void> setChallenge(ChallengeData challenge) =>
      _service.setData(path: FirestorePath.challengeData(challenge.id), data: challenge.toJson());
}
