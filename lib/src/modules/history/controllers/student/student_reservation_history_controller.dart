import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentReservationHistoryController
    extends BaseListController<ReservationSchedule> {
  final dummyData = [
    ReservationSchedule(
      id: 0,
      nim: '195150700111015',
      reservationTime: DateTime.parse('2022-11-25T08:00:00.000Z'),
      timeHours: '15:00',
      status: 4,
      description: 'Saya memiliki masalah dalam menjalankan perkuliahan',
      report: 'Kamu harus lebih fokus',
      location: 'Ruang Konseling A.16',
      type: 'Luring',
    ),
  ];

  @override
  void onInit() {
    final nim = '195150700111015';
    getReservationHistoryByNim(nim: nim);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    final nim = StorageManager().get(StorageName.MAHASISWA)['nim'];
    getReservationHistoryByNim(nim: nim);
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationHistoryStudent}/$id');
  }

  Future<void> getReservationHistoryByNim({required String nim}) async {
    loadingState();
    // await client().then((value) {
    //   value
    //       .fetchReservationScheduleByNim(nim: nim)
    //       .validateStatus()
    //       .then((data) {
    Future.delayed(const Duration(seconds: 3), () {
      dataList.clear();
      setFinishCallbacks(dummyData.reversed.toList());
    });
    // }).handleError((onError) {
    //   debugPrint(onError.toString());
    //   finishLoadData(errorMessage: onError.toString());
    // });
    // });
  }
}
