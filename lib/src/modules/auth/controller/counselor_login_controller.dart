import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorLoginController extends BaseObjectController<Konselor> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isObscured = true.obs;

  void goToHome() {
    Get.offNamed(PageName.homeKonselor);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginKonselor() async {
    loadingState();
    final fcmToken = await SecureStorageManager().getDeviceToken();

    await client().then((value) {
      value
          .loginMahasiswa(
            emailController.text,
            passwordController.text,
            fcmToken,
          )
          .validateStatus()
          .then((data) async {
        await SecureStorageManager().setToken(value: data.data?.token);
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
        setFinishCallbacks(data.data);
        goToHome();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
