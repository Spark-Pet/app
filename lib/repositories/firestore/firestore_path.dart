/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String userData(String id) => 'userData/$id';
  static String allUserData() => 'userData';

  static String userStats(String id) => 'userStats/$id';
  static String allUserStats() => 'usersStats';

  static String petStats(String id) => 'petStats/$id';
  static String allPetsStats() => 'petsStats';

  static String accessoryData(String id) => 'accessoryData/$id';
  static String allAccessoryData() => 'accessoryData';

  static String challengeData(String id) => 'challengeData/$id';
  static String allChallengeData() => 'challengeData';
}
