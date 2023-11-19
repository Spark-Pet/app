// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDatabaseHash() => r'3256f4789bc577740b97941417a09b6e35030584';

/// See also [userDatabase].
@ProviderFor(userDatabase)
final userDatabaseProvider = AutoDisposeProvider<UserDatabase>.internal(
  userDatabase,
  name: r'userDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDatabaseRef = AutoDisposeProviderRef<UserDatabase>;
String _$usersHash() => r'5a4d2b4b299dafb172f341ff351b02fdaa8ac438';

/// See also [users].
@ProviderFor(users)
final usersProvider = AutoDisposeStreamProvider<List<UserData>>.internal(
  users,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsersRef = AutoDisposeStreamProviderRef<List<UserData>>;
String _$currentUserEmailHash() => r'ebe2437f6972ee97697eb35d2bdd8970c77871da';

/// See also [currentUserEmail].
@ProviderFor(currentUserEmail)
final currentUserEmailProvider = AutoDisposeProvider<String>.internal(
  currentUserEmail,
  name: r'currentUserEmailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserEmailRef = AutoDisposeProviderRef<String>;
String _$currentUserHash() => r'1edbd30c88e10c69be5ba2764320588c90d257b8';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<UserData>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeFutureProviderRef<UserData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
