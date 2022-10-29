import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class CounselorStudentListController extends BaseListController<Mahasiswa> {
  @override
  void onInit() {
    getMahasiswaList();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getMahasiswaList();
  }

  void goToReservationHistory({required String nim}) {
    Get.toNamed('/reservation/$nim');
  }

  Future<void> getMahasiswaList() async {
    loadingState();
    await client().then((value) {
      value.fetchMahasiswaReservationList().validateStatus().then((data) {
        dataList.clear();
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
