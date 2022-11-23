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

class CreateNewCounselorController extends BaseObjectController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final majorController = TextEditingController();
  final nimController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lineIdController = TextEditingController();
  final studentEmailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    majorController.dispose();
    nimController.dispose();
    studentEmailController.dispose();
    phoneNumberController.dispose();
    lineIdController.dispose();
    super.dispose();
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
      Get.showSnackbar(
          SIMLKSnackbar(snackbarMessage: 'Data berhasil disimpan'));
    });
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }
}
