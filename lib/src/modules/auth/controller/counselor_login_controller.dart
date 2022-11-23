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

  void goToHomeKonselor() {
    Get.offNamed(PageName.rootCounselor);
  }

  void goToHomeKoordinator() {
    Get.offNamed(PageName.rootCoordinator);
  }

  void goToHomeSupervisor() {
    Get.offNamed(PageName.homeSupervisor);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginKonselor() async {
    loadingState();
    // final fcmToken = await SecureStorageManager().getDeviceToken();

    // await client().then((value) {
    //   value
    //       .loginKonselor(
    //         emailController.text,
    //         passwordController.text,
    //         fcmToken,
    //       )
    //       .validateStatus()
    //       .then((data) async {
    // await SecureStorageManager().setToken(value: data.data?.token);
    // await saveAuthData();
    Future.delayed(const Duration(milliseconds: 750), goToHomeKonselor);
    //   }).handleError((onError) {
    //     SecureStorageManager().setToken(value: null);
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> loginKoordinator() async {
    loadingState();
    // final fcmToken = await SecureStorageManager().getDeviceToken();

    // await client().then((value) {
    //   value
    //       .loginKonselor(
    //         emailController.text,
    //         passwordController.text,
    //         fcmToken,
    //       )
    //       .validateStatus()
    //       .then((data) async {
    // await SecureStorageManager().setToken(value: data.data?.token);
    // await saveAuthData();
    Future.delayed(const Duration(milliseconds: 750), goToHomeKoordinator);
    //   }).handleError((onError) {
    //     SecureStorageManager().setToken(value: null);
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> loginSupervisor() async {
    loadingState();
    // final fcmToken = await SecureStorageManager().getDeviceToken();

    // await client().then((value) {
    //   value
    //       .loginKonselor(
    //         emailController.text,
    //         passwordController.text,
    //         fcmToken,
    //       )
    //       .validateStatus()
    //       .then((data) async {
    // await SecureStorageManager().setToken(value: data.data?.token);
    // await saveAuthData();
    Future.delayed(const Duration(milliseconds: 750), goToHomeSupervisor);
    //   }).handleError((onError) {
    //     SecureStorageManager().setToken(value: null);
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> saveAuthData() async {
    loadingState();
    // await client().then((value) {
    //   value.fetchKonselorProfile().validateStatus().then((data) async {
    //     StorageManager().write(StorageName.KONSELOR, data.data?.toJson());
    //     setFinishCallbacks(data.data);
    // Future.delayed(const Duration(seconds: 3), goToHome);
    //     }).handleError((onError) {
    //       SecureStorageManager().setToken(value: null);
    //       debugPrint(onError.toString());
    //       finishLoadData(errorMessage: onError.toString());
    //     });
    //   });
  }
}
