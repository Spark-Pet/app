// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_stats_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petStatsDatabaseHash() => r'7b65962b54b0859152cd8736b4fb9f41924aa62f';

/// See also [petStatsDatabase].
@ProviderFor(petStatsDatabase)
final petStatsDatabaseProvider = AutoDisposeProvider<PetStatsDatabase>.internal(
  petStatsDatabase,
  name: r'petStatsDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petStatsDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetStatsDatabaseRef = AutoDisposeProviderRef<PetStatsDatabase>;
String _$petStatsHash() => r'5bd92f433c463e58bae0e56b4d0574855d60e593';

/// See also [petStats].
@ProviderFor(petStats)
final petStatsProvider = AutoDisposeStreamProvider<List<PetStats>>.internal(
  petStats,
  name: r'petStatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$petStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetStatsRef = AutoDisposeStreamProviderRef<List<PetStats>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
