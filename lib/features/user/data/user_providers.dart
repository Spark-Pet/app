import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/user_data.dart';
import 'user_database.dart';

part 'user_providers.g.dart';

@riverpod
UserDatabase userDatabase(UserDatabaseRef ref) {
  return UserDatabase(ref);
}

@riverpod
Stream<List<UserData>> users(UsersRef ref) {
  final database = ref.watch(userDatabaseProvider);
  return database.watchUsers();
}

@riverpod
String currentUserID(CurrentUserIDRef ref) {
  final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  return instance.currentUser!.email!;
}

@riverpod
Future<UserData> currentUser(CurrentUserRef ref) async {
  final String currentUserId = ref.watch(currentUserIDProvider);
  final database = ref.watch(userDatabaseProvider);
  return await database.fetchUser(currentUserId);
}
