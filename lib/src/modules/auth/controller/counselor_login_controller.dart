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

class CounselorLoginController extends BaseObjectController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isObscured = true.obs;
  final RxInt role = 5.obs;

  void goToHome() {
    if (role.value == 0) {
      Get.offNamed(PageName.homeSupervisor);
    } else if (role.value == 1) {
      Get.offNamed(PageName.rootCoordinator);
    } else {
      Get.offNamed(PageName.rootCounselor);
    }
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
    print(role);

    await client().then((value) {
      value
          .loginKonselor(
            emailController.text,
            passwordController.text,
            fcmToken,
            role.value,
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
      if (role.value == 0) {
        value.fetchPengawasProfile().validateStatus().then((data) async {
          StorageManager().write(StorageName.SUPERVISOR, data.data?.toJson());
          setFinishCallbacks(data.data?.toJson());
          goToHome();
        }).handleError((onError) {
          SecureStorageManager().setToken(value: null);
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        });
      } else if (role.value == 1) {
        value.fetchKoordinatorProfile().validateStatus().then((data) async {
          StorageManager().write(StorageName.KOORDINATOR, data.data?.toJson());
          setFinishCallbacks(data.data?.toJson());
          goToHome();
        }).handleError((onError) {
          SecureStorageManager().setToken(value: null);
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        });
      } else {
        value.fetchKonselorProfile().validateStatus().then((data) async {
          StorageManager().write(StorageName.KONSELOR, data.data?.toJson());
          setFinishCallbacks(data.data?.toJson());
          goToHome();
        }).handleError((onError) {
          SecureStorageManager().setToken(value: null);
          debugPrint(onError.toString());
          finishLoadData(errorMessage: onError.toString());
        });
      }
    });
  }
}
