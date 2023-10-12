class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.petId,
    required this.statsId,
    required this.bones,
    required this.purchasedAccessoryIds,
    required this.activeChallengeIds,
    required this.pastChallengeIds,
    this.imagePath,
  });

  String id;
  String name;
  String email;
  String username;
  String petId;
  String statsId;
  int bones;
  List<String> purchasedAccessoryIds;
  List<String> activeChallengeIds;
  List<String> pastChallengeIds;
  String? imagePath;
}

class UserDB {
  final List<UserData> _users = [
    UserData(
      id: 'user-001',
      name: 'John Doe',
      username: 'jdoe',
      email: 'johndoe@gmail.com',
      petId: 'pet-001',
      statsId: 'stats-001',
      bones: 100,
      purchasedAccessoryIds: ['accessory-001'],
      activeChallengeIds: [],
      pastChallengeIds: [],
    ),
    UserData(
      id: 'user-002',
      name: 'Jane Doe',
      username: 'janedoe',
      email: 'janedoe@mail.com',
      petId: 'pet-002',
      statsId: 'stats-002',
      bones: 100,
      purchasedAccessoryIds: [],
      activeChallengeIds: [],
      pastChallengeIds: [],
    ),
    UserData(
      id: 'user-003',
      name: 'John Smith',
      username: 'jsmith',
      email: 'jsmith@gmail.com',
      petId: 'pet-003',
      statsId: 'stats-003',
      bones: 100,
      purchasedAccessoryIds: [],
      activeChallengeIds: [],
      pastChallengeIds: [],
    )
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  List<UserData> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }
}

/// The singleton instance providing access to all user data for clients.
UserDB userDB = UserDB();

/// The currently logged in user.
String currentUserID = 'user-001';
