import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pet_stats.dart';
import 'pet_stats_database.dart';

part 'pet_stats_providers.g.dart';

@riverpod
PetStatsDatabase petStatsDatabase(PetStatsDatabaseRef ref) {
  return PetStatsDatabase(ref);
}

@riverpod
Stream<List<PetStats>> petStats(PetStatsRef ref) {
  final database = ref.watch(petStatsDatabaseProvider);
  return database.watchAllPetStats();
}
