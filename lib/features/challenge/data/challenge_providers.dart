import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/challenge_data.dart';
import 'challenge_database.dart';

part 'challenge_providers.g.dart';

@riverpod
ChallengeDatabase challengeDatabase(ChallengeDatabaseRef ref) {
  return ChallengeDatabase(ref);
}

@riverpod
Stream<List<ChallengeData>> challenges(ChallengesRef ref) {
  final database = ref.watch(challengeDatabaseProvider);
  return database.watchChallenges();
}
