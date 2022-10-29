import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorProfileController extends BaseObjectController<Konselor> {
  @override
  void onInit() {
    if (StorageManager().has(StorageName.KONSELOR)) {
      final konselor =
          Konselor.fromJson(StorageManager().get(StorageName.KONSELOR));
      setFinishCallbacks(konselor);
    }
    super.onInit();
  }

  Future<void> updateProfile() async {
    loadingState();

    // await client().then((value) {
    //   value
    //       .updateKonselorProfile(
    //         imageProfile: ,
    //       )
    //       .validateStatus()
    //       .then((data) async {
    //     finishLoadData();
    //     await saveAuthData();
    //   }).handleError((onError) {
    //     debugPrint(onError.toString());
    //     finishLoadData(errorMessage: onError.toString());
    //   });
    // });
  }

  Future<void> saveAuthData() async {
    loadingState();
    await client().then((value) {
      value.fetchKonselorProfile().validateStatus().then((data) async {
        StorageManager().write(StorageName.KONSELOR, data.data?.toJson());
        setFinishCallbacks(data.data);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> logout() async {
    loadingState();
    await client().then((value) {
      value.logout().validateStatus().then((data) async {
        await SecureStorageManager().setToken(value: null);
        StorageManager().write(StorageName.KONSELOR, null);
        finishLoadData();
        Get.offAllNamed(PageName.auth);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
