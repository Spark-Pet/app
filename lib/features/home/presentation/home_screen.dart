import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/common/presentation/bone_count_pill.dart';
import 'package:spark_pet/features/home/presentation/circular_progress.dart';

import '../../all_data_provider.dart';
import '../../common/presentation/spark_pet_nav_bar.dart';
import '../../pet_statistics/domain/pet_stats.dart';
import '../../user/domain/user_data.dart';
import '../../user_statistics/domain/user_stats.dart';
import '../../vito_error.dart';
import '../../vito_loading.dart';
import 'progress_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);

    return asyncAllData.when(
        data: (allData) {
          return _build(
            context: context,
            currentUserEmail: allData.currentUserEmail,
            allUserStats: allData.userStats,
            allUserData: allData.userData,
            allPetStats: allData.petStats,
            ref: ref,
          );
        },
        loading: () => const VitoLoading(),
        error: (error, st) => VitoError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required String currentUserEmail,
    required List<UserStats> allUserStats,
    required List<UserData> allUserData,
    required List<PetStats> allPetStats,
    required WidgetRef ref,
  }) {

    final UserData user = allUserData.firstWhere((user) => user.email == currentUserEmail);
    final UserStats userStats = allUserStats.firstWhere((stats) => stats.userId == user.id);
    final PetStats petStats = allPetStats.firstWhere((pet) => pet.id == user.petId);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                BoneCountPill(bonesCount: user.bones),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    //ref.read(showMainModalProvider.notifier).state = true;
                    //ref.read(mainModalProvider.notifier).state = Container(child: const SettingsModal());
                    print('settings pressed');
                  },
                ),
              ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Expanded(child: ProgressBar(
                  progressBarColor: const Color(0xffe1ab3c),
                  title: 'Level ${petStats.currentLevel}',
                  currentProgress: petStats.progressNextLevel,
                  progressTotal: 100,
                )),
                const SizedBox(width: 10),
                Expanded(child: ProgressBar(
                  progressBarColor: const Color(0xffe82c40),
                  title: 'HP ${petStats.hpCurrent}/${petStats.hpTotal}',
                  currentProgress: petStats.hpCurrent,
                  progressTotal: petStats.hpTotal,
                )),
              ],
            ),
            const SizedBox(height: 6),
            const Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Image(
                      image: AssetImage('assets/images/dog.png'),
                      width: 180,
                      height: 180
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Image(
                        image: AssetImage('assets/images/dish.png'),
                        width: 100,
                        height: 100
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CircularProgress(
              progressBarColor: const Color(0xff1d8eec),
              title: "Steps",
              currentProgress: userStats.steps[6].toDouble(),
              goal: userStats.dailyStepsGoal.toDouble(),
              round: true,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'FILL BOWL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}