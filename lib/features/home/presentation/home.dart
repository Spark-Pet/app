import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/features/common/presentation/bone_count_pill.dart';
import 'package:spark_pet/features/home/presentation/circular_progress.dart';
import 'package:spark_pet/features/pet_statistics/domain/pet_stats.dart';

import '../../pet_statistics/data/pet_stats_provider.dart';
import '../../user/data/user_providers.dart';
import '../../user/domain/user_data.dart';
import '../../user_statistics/data/user_stats_provider.dart';
import 'progress_bar.dart';
import 'settings_modal.dart';
import '../../user_statistics/domain/user_stats.dart';
import '../../../sparkpet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserData user = ref.watch(userDbProvider).getUser(ref.watch(currentUserIDProvider));
    final PetStats pet = ref.watch(petStatsDbProvider).getPet(user.petId);
    final UserStats stats = ref.watch(userStatsDbProvider).getStats(user.id);

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
                    ref.read(showMainModalProvider.notifier).state = true;
                    ref.read(mainModalProvider.notifier).state = Container(child: const SettingsModal());
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
                  title: 'Level ${pet.currentLevel}',
                  currentProgress: pet.progressNextLevel,
                  progressTotal: 100,
                )),
                const SizedBox(width: 10),
                Expanded(child: ProgressBar(
                  progressBarColor: const Color(0xffe82c40),
                  title: 'HP ${pet.hpCurrent}/${pet.hpTotal}',
                  currentProgress: pet.hpCurrent,
                  progressTotal: pet.hpTotal,
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
              currentProgress: stats.steps[6].toDouble(),
              goal: stats.dailyStepsGoal.toDouble(),
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
