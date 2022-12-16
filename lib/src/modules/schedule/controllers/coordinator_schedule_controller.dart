import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_profile_dialog.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CoordinatorScheduleController extends BaseListController<Konselor> {
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
        enableScheduleSet: true,
        onScheduleSet: (dates) {
          setKonselorSchedule(
            konselorId: data.id,
            jadwal: dates?.join(','),
          );
        },
      ),
    );
  }

  void goToCreateCounselor() {
    Get.toNamed(PageName.createNewCounselor);
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

  Future<void> setKonselorSchedule({int? konselorId, String? jadwal}) async {
    loadingState();
    await client().then((value) {
      value
          .setKonselorSchedule(idKonselor: konselorId, jadwal: jadwal)
          .validateStatus()
          .then((data) {
        finishLoadData();
        Get.back();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Jadwal Konselor Telah Disimpan',
          snackbarStateEnum: SnackbarStateEnum.POSITIVE,
        ));
        refreshPage();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
