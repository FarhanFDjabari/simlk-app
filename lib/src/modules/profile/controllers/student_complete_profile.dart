import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentCompleteProfileController extends BaseObjectController {
  final dosenPaController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lineIdController = TextEditingController();
  final studentEmailController = TextEditingController();
  bool isFromLogin = false;

  @override
  void onInit() {
    if (Get.arguments?['from_login'] == true) {
      isFromLogin = true;
    }
    if (StorageManager().has(StorageName.MAHASISWA)) {
      final mahasiswa =
          Mahasiswa.fromJson(StorageManager().get(StorageName.MAHASISWA));
      studentEmailController.text = mahasiswa.email ?? "";
      dosenPaController.text = mahasiswa.dpa ?? "";
      phoneNumberController.text = mahasiswa.noHp ?? "";
      lineIdController.text = mahasiswa.idLine ?? "";
    }
    super.onInit();
  }

  @override
  void dispose() {
    dosenPaController.dispose();
    phoneNumberController.dispose();
    lineIdController.dispose();
    super.dispose();
  }

  void goToHome() {
    Get.offAllNamed(PageName.root);
  }

  Future<void> updateProfile() async {
    loadingState();

    await client().then((value) {
      value
          .updateMahasiswaProfile(
            dosenPa: dosenPaController.text,
            idLine: lineIdController.text,
            noHp: phoneNumberController.text,
            email: studentEmailController.text,
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
      value.fetchMahasiswaProfile().validateStatus().then((data) async {
        StorageManager().write(StorageName.MAHASISWA, data.data?.toJson());
        finishLoadData();
        if (isFromLogin) {
          goToHome();
        } else {
          Get.showSnackbar(SIMLKSnackbar(snackbarMessage: data.message));
        }
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
