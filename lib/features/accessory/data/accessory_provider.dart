import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/accessory_data.dart';

final Provider<AccessoryDb> accessoryDbProvider = Provider<AccessoryDb>((_) => AccessoryDb());
