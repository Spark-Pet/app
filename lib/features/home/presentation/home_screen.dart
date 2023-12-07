import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedometer/pedometer.dart';
import 'package:spark_pet/features/common/presentation/bone_count_pill.dart';
import 'package:spark_pet/features/home/presentation/circular_progress.dart';

import '../../all_data_provider.dart';
import '../../main_screen.dart';
import '../../pet_statistics/domain/pet_stats.dart';
import '../../settings/presentation/settings_modal.dart';
import '../../user/domain/user_data.dart';
import '../../user_statistics/domain/user_stats.dart';
import '../../vito_error.dart';
import '../../vito_loading.dart';
import 'progress_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 0;
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 20),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image(
                  image: AssetImage('assets/images/dog.png'),
                  width: 450,
                  height: 450
                ),
              ),
            ),
            CircularProgress(
              progressBarColor: const Color(0xff1d8eec),
              title: "Steps",
              currentProgress: _steps,
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
