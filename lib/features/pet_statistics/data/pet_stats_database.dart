import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/pet_stats.dart';

// Provides access to the Firestore database storing User documents.
class PetStatsDatabase {
  PetStatsDatabase(this.ref);

  final ProviderRef<PetStatsDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<PetStats>> watchAllPetStats() => _service.watchCollection(
      path: FirestorePath.allPetsStats(),
      builder: (data, documentId) => PetStats.fromJson(data!));

  Stream<PetStats> watchPetStats(String id) => _service.watchDocument(
      path: FirestorePath.petStats(id),
      builder: (data, documentId) => PetStats.fromJson(data!));

  Future<List<PetStats>> fetchAllPetStats() => _service.fetchCollection(
      path: FirestorePath.allPetsStats(),
      builder: (data, documentId) => PetStats.fromJson(data!));

  Future<PetStats> fetchPetStats(String id) => _service.fetchDocument(
      path: FirestorePath.petStats(id),
      builder: (data, documentId) => PetStats.fromJson(data!));

  Future<void> setPetStats(PetStats petStats) =>
      _service.setData(path: FirestorePath.petStats(petStats.id), data: petStats.toJson());
}
