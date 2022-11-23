import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorReservationHistoryController
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
    loadingState();
    setFinishCallbacks(dummyData);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goToDetail({required int id}) {
    Get.toNamed('/konselor/history/$id');
  }
}
