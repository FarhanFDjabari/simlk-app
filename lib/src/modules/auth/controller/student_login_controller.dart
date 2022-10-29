import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentLoginController extends BaseObjectController<Mahasiswa> {
  final nimController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isObscured = true.obs;

  void goToHome() {
    Get.offNamed(PageName.root);
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteStudent,
        arguments: {'from_login': true});
  }

  @override
  void dispose() {
    nimController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginMahasiswa() async {
    loadingState();
    final fcmToken = await SecureStorageManager().getDeviceToken();

    await client().then((value) {
      value
          .loginMahasiswa(
            nimController.text,
            passwordController.text,
            fcmToken,
          )
          .validateStatus()
          .then((data) async {
        await SecureStorageManager().setToken(value: data.data?.token);
        await saveAuthData();
      }).handleError((onError) {
        SecureStorageManager().setToken(value: null);
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
        setFinishCallbacks(data.data);
        if (data.data?.dpa != null) {
          goToHome();
        } else {
          goToCompleteProfile();
        }
      }).handleError((onError) {
        SecureStorageManager().setToken(value: null);
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
