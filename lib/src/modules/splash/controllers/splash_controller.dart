import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
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
    await checkUserData();
  }

  Future<void> checkInternetCon() async {
    try {
      await InternetAddress.lookup(
        'google.com',
        type: InternetAddressType.IPv4,
      );
    } on SocketException catch (_) {
      Get.defaultDialog(
        title: 'Connection Error',
        content: TextNunito(
          text: 'Perangkat kamu tidak terkoneksi dengan internet',
          size: 12.sp,
          fontWeight: Weightenum.REGULAR,
        ),
        textConfirm: 'Aktifkan Koneksi Internet',
        onConfirm: () async {
          await AppSettings.openDeviceSettings(
            asAnotherTask: true,
          );
        },
      );
    }
  }

  Future<void> checkUserData() async {
    if (await SecureStorageManager().getToken() == null) {
      Get.offNamed(PageName.auth);
    } else {
      if (StorageManager().has(StorageName.MAHASISWA)) {
        Get.offNamed(PageName.root);
      } else if (StorageManager().has(StorageName.KONSELOR)) {
        Get.offNamed(PageName.homeKonselor);
      } else {
        Get.offNamed(PageName.auth);
      }
    }
  }
}
