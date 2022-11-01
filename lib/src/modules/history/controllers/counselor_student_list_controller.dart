import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class CounselorStudentListController extends BaseListController<Mahasiswa> {
  final dummyData = [
    Mahasiswa(
      nim: '195150700111015',
      dpa: 'Issa Arwani',
      email: 'ffadhilah8@student.ub.ac.id',
      name: 'Farhan Fadhilah Djabari',
      role: 1,
      noHp: '085156012902',
      idLine: 'ffadhilahdjabari',
      profileImageUrl:
          "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
    ),
  ];

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
    // await client().then((value) {
    //   value.fetchKonselorReservationHistory().validateStatus().then((data) {
    Future.delayed(const Duration(seconds: 3), () {
      dataList.clear();
      setFinishCallbacks(dummyData);
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
