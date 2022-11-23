import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/bottom_sheet/textfield_bottomsheet.dart';
import 'package:simlk_app/src/modules/common/widgets/bottom_sheet/upload_file_bottomsheet.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_report_dialog.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CoordinatorReservationDetailController
    extends BaseObjectController<ReservationSchedule> {
  final counselingLocationController = TextEditingController();
  final counselingFinalReportController = TextEditingController();

  final dummyData = ReservationSchedule(
    id: 0,
    nim: '195150700111015',
    reservationTime: DateTime.parse('2022-11-25T08:00:00.000Z'),
    timeHours: '15:00',
    status: 3,
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
  );

  @override
  void onInit() {
    id = Get.parameters['id'].toString();
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
      counselingLocationController.text = dummyData.location ?? "";
      setFinishCallbacks(dummyData);
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  void goToAssignCounselor({required int id}) {
    Get.toNamed('/coordinator/reservation/$id/assign-counselor');
  }

  Future<void> setReservationStatus(
      {required int id, required int status}) async {
    // loadingState();
    // await client().then((value) {
    //   value
    //       .updateReservationStatus(
    //         status: status,
    //         reservationId: id,
    //         location: counselingLocationController.text,
    //       )
    //       .validateStatus()
    //       .then((data) {
    //     finishLoadData();
    //     Get.showSnackbar(SIMLKSnackbar(
    //       snackbarMessage:
    //           'Berhasil mengubah status reservasi: ${status == 2 ? 'DALAM PROSES' : status == 3 ? 'PENANGANAN' : 'SELESAI'}',
    //       snackbarStateEnum: SnackbarStateEnum.POSITIVE,
    //     ));
    //     getReservationDetail(id: id);
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
