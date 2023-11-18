// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeDatabaseHash() => r'c7f2a50b8f0ac2cf09dc5e1e5752fb0cb4a1f633';

/// See also [challengeDatabase].
@ProviderFor(challengeDatabase)
final challengeDatabaseProvider =
    AutoDisposeProvider<ChallengeDatabase>.internal(
  challengeDatabase,
  name: r'challengeDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$challengeDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChallengeDatabaseRef = AutoDisposeProviderRef<ChallengeDatabase>;
String _$challengesHash() => r'0de3493c26ff92aecb5e3ec29c7f39dbd35197ba';

/// See also [challenges].
@ProviderFor(challenges)
final challengesProvider =
    AutoDisposeStreamProvider<List<ChallengeData>>.internal(
  challenges,
  name: r'challengesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$challengesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChallengesRef = AutoDisposeStreamProviderRef<List<ChallengeData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
