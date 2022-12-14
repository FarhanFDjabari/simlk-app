import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';
import 'package:sizer/sizer.dart';

class SplashController extends BaseObjectController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> initSplash() async {
    loadingState();
    await checkInternetCon();
  }

  Future<void> checkInternetCon() async {
    try {
      await InternetAddress.lookup(
        'google.com',
        type: InternetAddressType.IPv4,
      );
      final fcmDeviceId = await FirebaseMessaging.instance.getToken();
      debugPrint('FCM token: $fcmDeviceId');
      await SecureStorageManager().setDeviceToken(value: fcmDeviceId);
      await checkUserData();
    } on SocketException catch (_) {
      Get.defaultDialog(
        title: 'Koneksi Error',
        content: TextNunito(
          text: 'Perangkat kamu tidak terkoneksi dengan internet',
          size: 12.sp,
          maxLines: 2,
          fontWeight: Weightenum.REGULAR,
          align: TextAlign.center,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        confirm: PrimaryButton(
          height: 40,
          elevation: 0,
          label: 'Aktifkan Koneksi Internet',
          onPressed: () async {
            await AppSettings.openDeviceSettings(
              asAnotherTask: true,
            );
          },
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> checkUserData() async {
    if (await SecureStorageManager().getToken() == null) {
      Get.offNamed(PageName.auth);
    } else {
      if (StorageManager().has(StorageName.MAHASISWA)) {
        Get.offNamed(PageName.root);
      } else if (StorageManager().has(StorageName.KONSELOR)) {
        Get.offNamed(PageName.rootCounselor);
      } else if (StorageManager().has(StorageName.KOORDINATOR)) {
        Get.offNamed(PageName.rootCoordinator);
      } else if (StorageManager().has(StorageName.SUPERVISOR)) {
        Get.offNamed(PageName.homeSupervisor);
      } else {
        Get.offNamed(PageName.auth);
      }
    }
  }
}
