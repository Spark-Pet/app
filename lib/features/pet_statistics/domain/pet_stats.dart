class PetStats {
  PetStats({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.hpCurrent,
    required this.hpTotal,
    required this.currentLevel,
    required this.progressNextLevel,
    required this.equippedAccessoryIds,
  });

  String id;
  String ownerId;
  String name;
  int hpCurrent;
  int hpTotal;
  int currentLevel;
  int progressNextLevel;
  List<String> equippedAccessoryIds;
}

class PetStatsDb {
  final List<PetStats> _pets = [
    PetStats(
      id: 'pet-001',
      ownerId: 'user-001',
      name: 'Sparky',
      hpCurrent: 92,
      hpTotal: 100,
      currentLevel: 3,
      progressNextLevel: 60,
      equippedAccessoryIds: ['accessory-001'],
    ),
    PetStats(
      id: 'pet-002',
      ownerId: 'user-002',
      name: 'Fido',
      hpCurrent: 80,
      hpTotal: 100,
      currentLevel: 4,
      progressNextLevel: 10,
      equippedAccessoryIds: [],
    ),
    PetStats(
      id: 'pet-003',
      ownerId: 'user-003',
      name: 'Rover',
      hpCurrent: 67,
      hpTotal: 100,
      currentLevel: 2,
      progressNextLevel: 80,
      equippedAccessoryIds: [],
    ),
  ];

  PetStats getPet(String petId) {
    return _pets.firstWhere((data) => data.id == petId);
  }

  PetStats getPetByOwnerId(String ownerId) {
    return _pets.firstWhere((data) => data.ownerId == ownerId);
  }
}
