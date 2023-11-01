import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/challenges_data.dart';

final Provider<ChallengesDb> challengesDbProvider = Provider<ChallengesDb>((_) => ChallengesDb());
