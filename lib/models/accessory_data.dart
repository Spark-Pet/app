class AccessoryData {
  AccessoryData({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.type,
  });

  String id;
  String name;
  String imagePath;
  int price;
  String type;
}

class AccessoryDb {
  final List<AccessoryData> _accessories = [
    AccessoryData(
      id: 'accessory-001',
      name: 'Cowboy Hat',
      imagePath: 'assets/images/accessories/hat-cowboy.png',
      price: 150,
      type: 'hat',
    ),
    AccessoryData(
      id: 'accessory-002',
      name: 'Top Hat',
      imagePath: 'assets/images/accessories/hat-top.png',
      price: 300,
      type: 'hat',
    ),
    AccessoryData(
      id: 'accessory-003',
      name: 'Puffy Jacket',
      imagePath: 'assets/images/accessories/jacket-puffy.png',
      price: 500,
      type: 'hat',
    ),
    AccessoryData(
      id: 'accessory-004',
      name: 'Health Potion',
      imagePath: 'assets/images/accessories/potion.png',
      price: 1000,
      type: 'potion',
    ),
  ];

  AccessoryData getAccessoryByID(String accessoryId) {
    return _accessories.firstWhere((data) => data.id == accessoryId);
  }

  List<AccessoryData> getAllAccessoriesById(List<String> accessoryIds) {
    return _accessories.where((data) => accessoryIds.contains(data.id)).toList();
  }

  List<AccessoryData> getAllAccessoriesExcept(List<String> accessoryIds) {
    return _accessories.where((data) => !accessoryIds.contains(data.id)).toList();
  }
}

AccessoryDb accessoryDb = AccessoryDb();
