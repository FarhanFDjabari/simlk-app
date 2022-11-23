import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class CounselorReservationHistoryDetailController
    extends BaseObjectController<ReservationSchedule> {
  final reportController = TextEditingController();
  final RxString pickedFileName = "Upload File".obs;
  File? pickedFile;

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
    // id = Get.parameters['id'].toString();
    getReservationDetail(
        id: int.tryParse(Get.parameters['id'].toString()) ?? 0);
    super.onInit();
  }

  @override
  void dispose() {
    reportController.dispose();
    super.dispose();
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = File(result.files.single.path!);
      pickedFileName(result.files.single.name);
    } else {
      // User canceled the picker
    }
  }

  Future<void> getReservationDetail({required int id}) async {
    loadingState();
    // await client().then((value) {
    //   value
    //       .fetchMahasiswaReservationDetail(id: id)
    //       .validateStatus()
    //       .then((data) {
    Future.delayed(const Duration(seconds: 3), () {
      setFinishCallbacks(dummyData);
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> setReservationReport({required int id}) async {
    // loadingState();
    // await client().then((value) {
    //   value
    //       .updateMahasiswaReservationReport(
    //         id: id,
    //         report: reportController.text,
    //       )
    //       .validateStatus()
    //       .then((data) {
    //     mData?.report = reportController.text;
    //     finishLoadData();
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
