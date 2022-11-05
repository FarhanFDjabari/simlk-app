import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class CounselorReservationHistoryDetailController
    extends BaseObjectController<ReservationSchedule> {
  final reportController = TextEditingController();
  final RxString pickedFileName = "Upload File".obs;
  File? pickedFile;

  @override
  void onInit() {
    id = Get.parameters['id'].toString();
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
    await client().then((value) {
      value
          .fetchMahasiswaReservationDetail(id: id)
          .validateStatus()
          .then((data) {
        reportController.text = data.data?.report ?? "";
        setFinishCallbacks(data.data);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> setReservationReport({required int id}) async {
    loadingState();
    await client().then((value) {
      value
          .updateMahasiswaReservationReport(
            id: id,
            report: reportController.text,
          )
          .validateStatus()
          .then((data) {
        mData?.report = reportController.text;
        finishLoadData();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
