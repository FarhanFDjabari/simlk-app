import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/home/controller/student_home_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentReservationController
    extends BaseListController<ReservationSchedule> {
  final dummyData = [
    ReservationSchedule(
      id: 0,
      nim: '195150700111015',
      reservationTime: DateTime.parse('2022-11-25T08:00:00.000Z'),
      timeHours: '15:00',
      status: 2,
      description: 'Saya memiliki masalah dalam menjalankan perkuliahan',
      report: 'Kamu harus lebih fokus',
      location: 'Ruang Konseling A.16',
      type: 'Luring',
    ),
  ];
  @override
  void onInit() {
    getStudentReservations();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getStudentReservations();
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationStudent}/$id');
  }

  Future<void> getStudentReservations() async {
    loadingState();
    // await client().then((value) {
    //   value.fetchMahasiswaOngoingReservation().validateStatus().then((data) {
    Future.delayed(const Duration(seconds: 3), () {
      dataList.clear();
      Get.find<StudentHomeController>().dataList.clear();
      Get.find<StudentHomeController>().setFinishCallbacks(dummyData);
      setFinishCallbacks(dummyData.reversed.toList());
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
