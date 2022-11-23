import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorHomeController extends BaseListController<ReservationSchedule> {
  final dummyDataU = Konselor(
    id: 1,
    name: 'Konselor Prototype',
    profileImageUrl:
        "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
    email: 'konselor@test.com',
  );

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
      student: Mahasiswa(
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
    ),
  ];

  Konselor get localUserData {
    return dummyDataU;
  }

  @override
  void onReady() {
    Get.find<CounselorNotificationController>().getAllNotifications();
    super.onReady();
  }

  @override
  void onInit() {
    getOngoingReservations();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getOngoingReservations();
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteCounselor);
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationKonselor}/$id');
  }

  Future<void> getOngoingReservations() async {
    loadingState();
    // await client().then((value) {
    //   value.fetchKonselorOngoingReservation().validateStatus().then((data) {
    Future.delayed(const Duration(seconds: 3), () {
      dataList.clear();
      setFinishCallbacks(dummyData.reversed.toList());
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
