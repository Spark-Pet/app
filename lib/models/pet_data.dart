class PetData {
  PetData({
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

class PetDb {
  final List<PetData> _pets = [
    PetData(
      id: 'pet-001',
      ownerId: 'user-001',
      name: 'Sparky',
      hpCurrent: 100,
      hpTotal: 100,
      currentLevel: 1,
      progressNextLevel: 0,
      equippedAccessoryIds: ['accessory-001'],
    ),
    PetData(
      id: 'pet-002',
      ownerId: 'user-002',
      name: 'Fido',
      hpCurrent: 100,
      hpTotal: 100,
      currentLevel: 1,
      progressNextLevel: 0,
      equippedAccessoryIds: [],
    ),
    PetData(
      id: 'pet-003',
      ownerId: 'user-003',
      name: 'Rover',
      hpCurrent: 100,
      hpTotal: 100,
      currentLevel: 1,
      progressNextLevel: 0,
      equippedAccessoryIds: [],
    ),
  ];

  PetData getPet(String petId) {
    return _pets.firstWhere((data) => data.id == petId);
  }

  PetData getPetByOwnerId(String ownerId) {
    return _pets.firstWhere((data) => data.ownerId == ownerId);
  }
}

PetDb petDb = PetDb();
