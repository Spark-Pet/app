// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStatsDatabaseHash() => r'7a08b9a459c43d97407bb2bce88dd716870cece9';

/// See also [userStatsDatabase].
@ProviderFor(userStatsDatabase)
final userStatsDatabaseProvider =
    AutoDisposeProvider<UserStatsDatabase>.internal(
  userStatsDatabase,
  name: r'userStatsDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userStatsDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStatsDatabaseRef = AutoDisposeProviderRef<UserStatsDatabase>;
String _$userStatsHash() => r'2fccafa127df698017ecf7758bd58289a51470ed';

/// See also [userStats].
@ProviderFor(userStats)
final userStatsProvider = AutoDisposeStreamProvider<List<UserStats>>.internal(
  userStats,
  name: r'userStatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStatsRef = AutoDisposeStreamProviderRef<List<UserStats>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
