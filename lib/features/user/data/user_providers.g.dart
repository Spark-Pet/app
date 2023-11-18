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
String _$currentUserIDHash() => r'fcc1b736638289871b82e61abfd9a5984bede617';

/// See also [currentUserID].
@ProviderFor(currentUserID)
final currentUserIDProvider = AutoDisposeProvider<String>.internal(
  currentUserID,
  name: r'currentUserIDProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIDHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserIDRef = AutoDisposeProviderRef<String>;
String _$currentUserHash() => r'df977552e228aa614e5f1ba325dd0b22a113a13e';

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
