import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';
import 'package:simlk_app/src/utils/helper/notifications/notification_helper.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentHomeController extends BaseListController<ReservationSchedule> {
  final RxInt notificationCount = 0.obs;
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime> selectedDay = DateTime.now().obs;
  final RxString counselingType = "Luring".obs;
  final RxString timeHour = "00:00".obs;
  final descriptionController = TextEditingController();
  final RxList<String> reservationTimeAvailable = <String>[].obs;

  @override
  void onInit() async {
    await getReservationTimeInDate(date: DateTime.now().toLocal().toString());
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
    Get.toNamed(PageName.notificationStudent);
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteStudent);
  }

  void resetForm() {
    descriptionController.clear();
  }

  Mahasiswa get localUserData =>
      Mahasiswa.fromJson(StorageManager().get(StorageName.MAHASISWA));

  Future<void> getOngoingSchedule() async {
    loadingState();
    await client().then((value) {
      value.fetchMahasiswaOngoingReservation().validateStatus().then((data) {
        dataList.clear();
        Get.find<StudentReservationController>().dataList.clear();
        Get.find<StudentReservationController>()
            .setFinishCallbacks(data.data?.reversed.toList() ?? []);
        setFinishCallbacks(data.data ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> getReservationTimeInDate({required String date}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchReservationTimeByDate(date: date)
          .validateStatus()
          .then((data) {
        final availableTimeFromApi =
            data.data?.map((e) => e.timeHours ?? "").toList();
        reservationTimeAvailable(availableTimeFromApi);
        timeHour("00:00");
        finishLoadData();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> createNewReservation() async {
    loadingState();
    await client().then((value) {
      value
          .createMahasiswaReservation(
            counselingType: counselingType.value,
            description: descriptionController.text,
            reservationTime: selectedDay.value.toLocal().toString(),
            timeHours: timeHour.value,
          )
          .validateStatus()
          .then((data) {
        NotificationHelper().scheduleNotification(0, selectedDay.value);
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Berhasil membuat reservasi',
          snackbarStateEnum: SnackbarStateEnum.POSITIVE,
        ));
        finishLoadData();
        getOngoingSchedule();
        resetForm();
        getReservationTimeInDate(date: selectedDay.value.toLocal().toString());
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
