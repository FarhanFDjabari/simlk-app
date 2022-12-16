import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_profile_dialog.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class SupervisorCounselorScheduleController
    extends BaseListController<Konselor> {
  final dateChipSelectedIndex = 0.obs;
  final dateChip = [
    'Semua',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jum\'at',
  ];

  @override
  void onInit() {
    loadingState();
    getKonselorSchedule();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getKonselorSchedule();
  }

  void showCounselorInfoDialog({
    required Konselor data,
    List<String>? counselorSchedule,
  }) async {
    final schedule = counselorSchedule?.map(int.parse).toList();
    Get.dialog(
      SIMLKProfileDialog(
        data: data,
        dayList: schedule,
      ),
    );
  }

  Future<void> getKonselorSchedule() async {
    loadingState();
    await client().then((value) {
      value
          .fetchKonselorOnDay(day: dateChipSelectedIndex.value)
          .validateStatus()
          .then((data) {
        dataList.clear();
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
