import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_data.dart';

final Provider<UserDb> userDbProvider = Provider<UserDb>((_) => UserDb());

final StateProvider<String> currentUserIDProvider = StateProvider<String>((_) => '');
