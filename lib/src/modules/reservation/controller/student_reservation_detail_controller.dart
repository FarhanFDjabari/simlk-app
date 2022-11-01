import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class StudentReservationDetailController
    extends BaseObjectController<ReservationSchedule> {
  final RxInt processIndex = 1.obs;

  final dummyData = ReservationSchedule(
    id: 0,
    nim: '195150700111015',
    reservationTime: DateTime.parse('2022-11-25T08:00:00.000Z'),
    timeHours: '15:00',
    status: 2,
    description: 'Saya memiliki masalah dalam menjalankan perkuliahan',
    report: 'Kamu harus lebih fokus',
    location: 'Ruang Konseling A.16',
    type: 'Luring',
  );

  final processes = [
    'Diajukan',
    'Dalam Proses',
    'Penanganan',
    'Selesai',
  ].obs;

  @override
  void onInit() {
    // id = Get.parameters['id'].toString();
    getReservationDetail(
        id: int.tryParse(Get.parameters['id'].toString()) ?? 0);
    super.onInit();
  }

  Future<void> getReservationDetail({required int id}) async {
    loadingState();
    // await client().then((value) {
    //   value
    //       .fetchMahasiswaReservationDetail(id: id)
    //       .validateStatus()
    //       .then((data) {
    Future.delayed(const Duration(seconds: 3), () {
      processIndex(dummyData.status);
      setFinishCallbacks(dummyData);
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
