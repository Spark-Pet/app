// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accessoryDatabaseHash() => r'afa980500020fb65a3635c4f0588654f101ea4c6';

/// See also [accessoryDatabase].
@ProviderFor(accessoryDatabase)
final accessoryDatabaseProvider =
    AutoDisposeProvider<AccessoryDatabase>.internal(
  accessoryDatabase,
  name: r'accessoryDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accessoryDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccessoryDatabaseRef = AutoDisposeProviderRef<AccessoryDatabase>;
String _$accessoriesHash() => r'f3b17b28f9d1dc3c75c0d60c31b9f4b5c15d3c8f';

/// See also [accessories].
@ProviderFor(accessories)
final accessoriesProvider =
    AutoDisposeStreamProvider<List<AccessoryData>>.internal(
  accessories,
  name: r'accessoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accessoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccessoriesRef = AutoDisposeStreamProviderRef<List<AccessoryData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
