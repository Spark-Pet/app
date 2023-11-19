import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/challenge/presentation/challenges.dart';
import 'package:spark_pet/features/accessory/presentation/closet.dart';
import 'package:spark_pet/features/authentication/presentation/login.dart';
import 'package:spark_pet/features/accessory/presentation/store.dart';
import 'package:spark_pet/features/home/presentation/home.dart';
import 'package:spark_pet/features/user_statistics/presentation/leaderboard.dart';

import 'features/all_data_provider.dart';
import 'features/common/presentation/spark_pet_nav_bar.dart';
import 'features/vito_error.dart';
import 'features/vito_loading.dart';

final StateProvider<bool> darkModeProvider = StateProvider<bool>((_) => false);
final StateProvider<int> currentPageProvider = StateProvider<int>((_) => 2);
final StateProvider<bool> showMainModalProvider = StateProvider<bool>((_) => false);
final StateProvider<Container> mainModalProvider = StateProvider<Container>((_) => Container());

class SparkPetHome extends ConsumerWidget {
  const SparkPetHome({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);

    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          currentUserId: allData.currentUserId,
          ref: ref,
        ),
        loading: () => const VitoLoading(),
        error: (error, st) => VitoError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required String currentUserId,
    required WidgetRef ref,
  }) {
    final int currentPageIndex = ref.watch(currentPageProvider);
    final bool showModal = ref.watch(showMainModalProvider);
    final Container modal = ref.watch(mainModalProvider);

    if (currentUserId.isEmpty) {
      return const LoginScreen();
    }

    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              <Widget>[
                const StoreScreen(),
                const ClosetScreen(),
                const HomeScreen(),
                const LeaderboardScreen(),
                const ChallengesScreen(),
              ][currentPageIndex],
              const SparkPetNavBar(),
              if (showModal) Stack(
                children: [
                  InkWell(
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      ref.read(showMainModalProvider.notifier).state = false;
                      ref.read(mainModalProvider.notifier).state = Container();
                    },
                  ),
                  Center(
                    child: modal,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
