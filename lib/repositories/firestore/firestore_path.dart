/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String userData(String id) => 'userData/$id';
  static String allUserData() => 'userData';

  static String userStats(String id) => 'userStats/$id';
  static String allUserStats() => 'userStats';

  static String petStats(String id) => 'petStats/$id';
  static String allPetsStats() => 'petStats';

  static String accessoryData(String id) => 'accessory/$id';
  static String allAccessoryData() => 'accessory';

  static String challengeData(String id) => 'challenge/$id';
  static String allChallengeData() => 'challenge';
}
