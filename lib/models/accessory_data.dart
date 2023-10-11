class AccessoryData {
  AccessoryData({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.type});

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
  ];

  AccessoryData getAccessory(String accessoryId) {
    return _accessories.firstWhere((data) => data.id == accessoryId);
  }

  List<String> getAllAccessoryIds() {
    return _accessories.map((data) => data.id).toList();
  }

  List<String> getAssociatedAccessoryIds(String userID) {
    Set<String> chapterIDs = {};
    // TODO
    return chapterIDs.toList();
  }
}

AccessoryDb accessoryDb = AccessoryDb();
