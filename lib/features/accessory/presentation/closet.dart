import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../all_data_provider.dart';
import '../../user/domain/user_data.dart';
import '../../vito_error.dart';
import '../../vito_loading.dart';
import 'closet_item.dart';
import '../domain/accessory_data.dart';

class ClosetScreen extends ConsumerWidget {
  const ClosetScreen({super.key});

  static const routeName = '/closet';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);

    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          currentUserEmail: allData.currentUserEmail,
          allUserData: allData.userData,
          allAccessories: allData.accessories,
          ref: ref,
        ),
        loading: () => const VitoLoading(),
        error: (error, st) => VitoError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required String currentUserEmail,
    required List<UserData> allUserData,
    required List<AccessoryData> allAccessories,
    required WidgetRef ref,
  }) {
    final List<String> userAccessoryIds = allUserData.firstWhere((user) => user.email == currentUserEmail).purchasedAccessoryIds;
    final List<AccessoryData> purchasedAccessories = allAccessories.where((accessory) => userAccessoryIds.contains(accessory.id)).toList();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Closet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: purchasedAccessories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClosetItem(
                    accessoryData: purchasedAccessories[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
