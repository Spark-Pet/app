
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/pet_stats.dart';

final Provider<PetStatsDb> petStatsDbProvider = Provider<PetStatsDb>((_) => PetStatsDb());
