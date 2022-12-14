import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorCompleteProfileController extends BaseObjectController {
  final nimController = TextEditingController();
  final lineIdController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final RxInt counselorStatus = 0.obs;
  bool isFromLogin = false;

  @override
  void onInit() {
    if (Get.arguments?['from_login'] == true) {
      isFromLogin = true;
    }
    if (StorageManager().has(StorageName.KONSELOR)) {
      final konselor =
          Konselor.fromJson(StorageManager().get(StorageName.KONSELOR));
      lineIdController.text = konselor.idLine ?? "";
      nimController.text = konselor.nim ?? "";
      phoneNumberController.text = konselor.noHp ?? "";
      counselorStatus(konselor.isAvailable);
    }
    super.onInit();
  }

  @override
  void dispose() {
    nimController.dispose();
    lineIdController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void goToHome() {
    Get.offAllNamed(PageName.rootCounselor);
  }

  Future<void> updateProfile() async {
    loadingState();
    await client().then((value) {
      value
          .updateKonselorProfile(
            nim: nimController.text,
            idLine: lineIdController.text,
            noHp: phoneNumberController.text,
            status: counselorStatus.value,
          )
          .validateStatus()
          .then((data) async {
        finishLoadData();
        await saveAuthData();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> saveAuthData() async {
    loadingState();
    await client().then((value) {
      value.fetchKonselorProfile().validateStatus().then((data) async {
        StorageManager().write(StorageName.KONSELOR, data.data?.toJson());
        finishLoadData();
        if (isFromLogin) {
          goToHome();
        } else {
          Get.showSnackbar(
              SIMLKSnackbar(snackbarMessage: 'Data berhasil disimpan'));
        }
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
