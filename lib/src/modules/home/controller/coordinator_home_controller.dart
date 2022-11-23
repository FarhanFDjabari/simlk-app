import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CoordinatorHomeController
    extends BaseListController<ReservationSchedule> {
  final RxInt notificationCount = 0.obs;

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

  final dummyKoordinator = Mahasiswa(
    nim: '195150700111015',
    dpa: 'Issa Arwani',
    email: 'ffadhilah8@student.ub.ac.id',
    name: 'Farhan Fadhilah Djabari',
    role: 1,
    noHp: '085156012902',
    idLine: '',
    profileImageUrl:
        "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
  );

  @override
  void onInit() async {
    getOngoingSchedule();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getOngoingSchedule();
  }

  void goToNotification() {
    Get.toNamed(PageName.notificationCoordinator);
  }

  void goToDetail({required int id}) {
    Get.toNamed('/coordinator/reservation/$id');
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteCoordinator);
  }

  Mahasiswa get localUserData => dummyKoordinator;

  Future<void> getOngoingSchedule() async {
    loadingState();
    // await client().then((value) {
    //   value.fetchMahasiswaOngoingReservation().validateStatus().then((data) {
    Future.delayed(const Duration(seconds: 1), () {
      dataList.clear();
      // Get.find<StudentReservationController>().dataList.clear();
      // Get.find<StudentReservationController>()
      //     .setFinishCallbacks(dummyData.reversed.toList());
      setFinishCallbacks(dummyData);
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
