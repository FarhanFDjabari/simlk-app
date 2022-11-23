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

class CoordinatorCompleteProfileController extends BaseObjectController {
  final nimController = TextEditingController();
  final lineIdController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isFromLogin = false;

  @override
  void onInit() {
    // if (Get.arguments?['from_login'] == true) {
    //   isFromLogin = true;
    // }
    // if (StorageManager().has(StorageName.KOORDINATOR)) {
    //   final mahasiswa =
    //       Mahasiswa.fromJson(StorageManager().get(StorageName.MAHASISWA));
    //   lineIdController.text = mahasiswa.idLine ?? "";
    // }
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
    Get.offAllNamed(PageName.root);
  }

  Future<void> updateProfile() async {
    loadingState();

    // await client().then((value) {
    //   value
    //       .updateMahasiswaProfile(
    //         dosenPa: dosenPaController.text,
    //         idLine: lineIdController.text,
    //         noHp: phoneNumberController.text,
    //         email: studentEmailController.text,
    //       )
    //       .validateStatus()
    //       .then((data) async {
    //     finishLoadData();
    await saveAuthData();
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> saveAuthData() async {
    loadingState();
    // await client().then((value) {
    //   value.fetchMahasiswaProfile().validateStatus().then((data) async {
    //     StorageManager().write(StorageName.MAHASISWA, data.data?.toJson());
    //     finishLoadData();
    Future.delayed(const Duration(seconds: 2), () {
      if (isFromLogin) {
        goToHome();
      } else {
        Get.showSnackbar(
            SIMLKSnackbar(snackbarMessage: 'Data berhasil disimpan'));
      }
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
