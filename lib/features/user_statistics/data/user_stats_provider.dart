import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_stats.dart';

final Provider<UserStatsDb> userStatsDbProvider = Provider<UserStatsDb>((ref) => UserStatsDb(ref));
