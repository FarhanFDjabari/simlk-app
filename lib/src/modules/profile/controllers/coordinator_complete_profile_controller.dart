import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/koordinator/koordinator.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CoordinatorCompleteProfileController extends BaseObjectController {
  final nimController = TextEditingController();
  final nameController = TextEditingController();
  bool isFromLogin = false;

  @override
  void onInit() {
    if (Get.arguments?['from_login'] == true) {
      isFromLogin = true;
    }
    if (StorageManager().has(StorageName.KOORDINATOR)) {
      final koordinator =
          Koordinator.fromJson(StorageManager().get(StorageName.KOORDINATOR));
      nimController.text = koordinator.nim ?? '';
      nameController.text = koordinator.name ?? '';
      setFinishCallbacks(koordinator);
    }
    super.onInit();
  }

  @override
  void dispose() {
    nimController.dispose();
    super.dispose();
  }

  void goToHome() {
    Get.offAllNamed(PageName.rootCoordinator);
  }

  Future<void> updateProfile() async {
    loadingState();

    await client().then((value) {
      value
          .updateKoordinatorProfile(
              nim: nimController.text, name: nameController.text)
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
      value.fetchKoordinatorProfile().validateStatus().then((data) async {
        StorageManager().write(StorageName.KOORDINATOR, data.data?.toJson());
        finishLoadData();
        if (isFromLogin) {
          goToHome();
        } else {
          Get.showSnackbar(
              SIMLKSnackbar(snackbarMessage: 'Data berhasil disimpan'));
        }
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
